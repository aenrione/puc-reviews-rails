class ParseCoursesInfo < PowerTypes::Command.new(:year, :semester)
	ABS_CATEGORY_COL_IDX = 17
	ABS_NAME_COL_IDX = 19
	COURSE_CHILDREN_LENGTH = 37

	def perform
		require 'json'
		require 'open-uri'
		ramos = []
		schools = JSON.parse(File.read("scrapper/schools.json"))
		total_schools = schools.count
		school_count = 0
		schools.each do |school|
			percentage = ((school_count / total_schools.to_f) * 100).round(2)
			logger.info "Obteniendo #{school['name']} | #{percentage}%"
			school_info = get_school_info(school)
			ramos << school_info
			school_count += 1
		end
		ramos.to_json
	end

	def get_school_info(school)
		school_info = Hash[school["name"], []]
		get_tr_elements(school["id"]).each do |row|
			if row.children.count == COURSE_CHILDREN_LENGTH
				ramo = get_row_info(row)
				school_info[school["name"]] << parse_course_from_info(ramo)
			end
		end
		school_info
	end

	def generate_url
		base_url = "http://buscacursos.uc.cl/?cxml_semestre=#{@year}-#{@semester}"
		base_url
	end

	def get_tr_elements(school_id)
		url = generate_url + "&cxml_unidad_academica=#{school_id}#resultados"
		website = Nokogiri::HTML(URI.open(url))
		tr_elements = website.xpath('.//tr')
		tr_elements
	end

	def get_content_from_col(col)
		content = col.text.split("\n").delete_if(&:empty?)
		content = content[0].strip if !content.empty? && content.length === 1
		content = nil if content.empty?
		content
	end

	def get_row_info(row)
		ramo = {}
		abs_col_idx = 0
		row.children.each do |col|
			if abs_col_idx == ABS_CATEGORY_COL_IDX || col.text.present?
				content = get_content_from_col(col)
				ramo[abs_col_idx] = content
			end
			abs_col_idx += 1
		end
		ramo
	end

	def parse_course_from_info(row_info)
		{
				"NRC": row_info[1],
				"Sigla": row_info[3],
				"Nombre": row_info[19],
				"Prof": row_info[21],
				"Campus": row_info[23],
				"Creditos": row_info[25],
				"Cupos Totales": row_info[27],
				"Cupos Disponibles": row_info[29],
				"Categoría": row_info[17],
				"Horario": row_info[33],
				"Formato": row_info[15]
		}
	end
end
