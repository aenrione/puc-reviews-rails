class AddSchoolsAndFacultiesFromJson < PowerTypes::Command.new
  def perform
    require 'json'
    faculties_and_schools_json = File.read('faculties.json')
    faculties_and_schools = JSON.parse(faculties_and_schools_json)

    add_faculties(faculties_and_schools)
  end

  def add_faculties(faculties)
    faculties.each do |faculty|
      faculty.each do |name, schools|
        faculty = Faculty.find_by(name: name).presence || Faculty.create!(name: name)
        schools.each do |school|
          school_name = school['name']
          new_school = add_school(school_name)
          add_school_faculty(new_school.id, faculty.id)
        end
      end
    end
    true
  end

  def add_school(school_name)
    School.find_by(name: school_name).presence ||
      School.create!(name: school_name)
  end

  def add_school_faculty(school_id, faculty_id)
    SchoolFaculty.find_by(school_id: school_id, faculty_id: faculty_id).presence ||
      SchoolFaculty.create!(school_id: school_id, faculty_id: faculty_id)
  end
end
