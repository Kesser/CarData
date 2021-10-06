# Ruby version 2.5.1

#Valid years are from 1900 until 2 years in the future from today
def car_year(year)
  year = year.to_i
  if year >= 1900 && year <= (Time.new.year + 2)
    year
  else
    year.to_s
  end
end


def car_make(make)
  makes = {
    'fo' => 'Ford',
    'ford' => 'Ford',
    'Chev' => 'Chevrolet',
  }
  return makes[make] || make
end

def car_model(model)
  models = {
    'focus' => 'Focus',
    'IMPALA' => 'Impala',
    'focus se' => 'Focus',
  }
  return models[model] || model 
end

#The word "blank" should be returned as nil
def car_trim(trim)
    return nil if trim == "blank"
    trims = {
      'st' => 'ST',
      'se' => 'SE',
    }
    return trims[trim] || trim
end


def normalize_data(input)

  model = car_model(input[:model])
  trim = car_trim(input[:trim])

  #Sometimes the trim of a vehicle will be provided in the "model" field, and will need to be extracted to the "trim" field
  split_model_trim = input[:model].split
  
  if split_model_trim.size == 2
    model = split_model_trim.first 
    trim  = split_model_trim.last
  end
  
  { :year => car_year(input[:year]), :make => car_make(input[:make]),
     :model => car_model(model), :trim => car_trim(trim) }
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