# Ruby version 2.5.1

require "./services/car_year_service.rb"
require "./services/car_make_service.rb"
require "./services/car_model_service.rb"
require "./services/car_trim_service.rb"


def normalize_data(input)

  model = CarModelService.call(input[:model])
  trim = CarTrimService.call(input[:trim])

  #Sometimes the trim of a vehicle will be provided in the "model" field, and will need to be extracted to the "trim" field
  split_model_trim = input[:model].split

  if split_model_trim.size == 2
    model = split_model_trim.first 
    trim  = split_model_trim.last
  end
  
  { :year => CarYearService.call(input[:year]), :make => CarMakeService.call(input[:make]),
     :model => CarModelService.call(model), :trim => CarTrimService.call(trim) }
end

examples = [
  [{ :year => '2018', :make => 'fo', :model => 'focus', :trim => 'blank' },
   { :year => 2018, :make => 'Ford', :model => 'Focus', :trim => nil }],
  [{ :year => '200', :make => 'blah', :model => 'foo', :trim => 'bar' },
   { :year => '200', :make => 'blah', :model => 'foo', :trim => 'bar' }],
  [{ :year => '1999', :make => 'Chev', :model => 'IMPALA', :trim => 'st' },
   { :year => 1999, :make => 'Chevrolet', :model => 'Impala', :trim => 'ST' }],
  [{ :year => '2000', :make => 'ford', :model => 'focus se', :trim => '' },
   { :year => 2000, :make => 'Ford', :model => 'Focus', :trim => 'SE' }]
]

examples.each_with_index do |(input, expected_output), index|
  if (output = normalize_data(input)) == expected_output
    puts "Example #{index + 1} passed!"
  else
    puts "Example #{index + 1} failed,
          Expected: #{expected_output.inspect}
          Got:      #{output.inspect}"
  end
end