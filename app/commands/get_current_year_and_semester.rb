class GetCurrentYearAndSemester < PowerTypes::Command.new
  def perform
    current_year = Time.zone.today.year
    current_month = Time.zone.today.month
    semester = if current_month >= 6
                 2
               else
                 1
               end
    [current_year, semester]
  end
end
