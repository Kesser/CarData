class CarMakeService

  def self.call(make)
    makes = {
    'fo' => 'Ford',
    'ford' => 'Ford',
    'Chev' => 'Chevrolet',
    }
    return makes[make] || make
  end

end
