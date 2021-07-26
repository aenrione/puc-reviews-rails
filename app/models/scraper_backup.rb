class ScraperBackup < ApplicationRecord
	validate :one_scraper_per_period

	def one_scraper_per_period
		if ScraperBackup.find_by(year: year, semester: semester).present?
			errors.add(:uniqueness, "Can't have more than 1 scraper per period")
		end
	end
end

# == Schema Information
#
# Table name: scraper_backups
#
#  id         :bigint(8)        not null, primary key
#  year       :integer          not null
#  semester   :integer          not null
#  json       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
