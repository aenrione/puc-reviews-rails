class AddCoursesAndTeachersFromJson < PowerTypes::Command.new(:year, :semester)
  UNDEFINED_TEACHER = 'Por Fijar'
  NO_TEACHER = '(Sin Profesores)'

  def perform
    require 'json'
    courses_json = File.read("scrapper/courses/#{@year}_#{@semester}.json")
    courses = JSON.parse(courses_json)

    add_courses(courses)
  end

  def add_courses(info)
    info.each do |school|
      school.each do |school_name, courses|
        db_school = School.find_by(name: school_name)
        if db_school.present?
          courses.each do |course_info|
            db_course = find_or_create_course(course_info, db_school.id)
            teacher_names = get_names(course_info["Prof"])
            teacher_names.each { |name| add_teacher_and_relationship(name, db_course.id) }
          end
        end
      end
    end
    true
  end

  def find_or_create_course(course_info, school_id)
    acronym = course_info['Sigla']
    Course.find_by(acronym: acronym).presence ||
      Course.create!(
        name: course_info['Nombre'],
        acronym: acronym,
        credits: course_info['Creditos'],
        campus: course_info['Campus'],
        school_id: school_id
      )
  end

  def add_teacher_and_relationship(name, course_id)
    return false if course_id.nil?

    teacher = Teacher.find_by(name: name).presence || Teacher.create!(name: name)
    if TeacherCourse.find_by(teacher_id: teacher.id, course_id: course_id, year: @year, semester: @semester).blank?
      TeacherCourse.create!(teacher_id: teacher.id, course_id: course_id, year: @year, semester: @semester)
    end
  end

  def get_school(id)
    return nil if School.where(id: id).blank?

    School.find(id)
  end

  def get_names(string)
    result = []
    string.split(', ').each do |full_name|
      next if full_name.include?(UNDEFINED_TEACHER) || full_name.include?(NO_TEACHER)

      if full_name.split(' ').length == 3
        new_name = full_name.split(' ')
        last_name = new_name[-2]
        name = new_name[-1]
        result << name + " " + last_name
      elsif full_name.split(' ').length == 2
        last_name = full_name.split.first
        name = full_name.split.last
        result << name + " " + last_name
      end
    end
    result
  end
end
