class AddSemesterInfoToDbJob < ApplicationJob
	def perform(year, semester, create_semester_courses = false)
		logger.info "Obteniendo JSON"
		json = ParseCoursesInfo.for(year: year, semester: semester)
		ScraperBackup.create(year: year, semester: semester, json: json)
		logger.info "\n"
		logger.info json
		logger.info "\n"
		logger.info "Agregando a DB"
		AddCoursesAndTeachersFromJson.for(
				json: json,
				year: year,
				semester: semester,
				create_semester_courses: create_semester_courses
		)
	end
end
