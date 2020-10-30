module ApplicationHelper
  def find_or_create_student(email, name)
    Student.find_by(name: name, email: email).presence ||
      Student.create!(name: name, email: email)
  end

  def student_present?
    return false if !params[:student_name] || !params[:student_email]

    true
  end
end
