class CarYearService
  
  def self.call(year)
    #Valid years are from 1900 until 2 years in the future from today
    year = year.to_i
    if year >= 1900 && year <= (Time.new.year + 2)
      year
    else
      year.to_s
    end
  end
end
