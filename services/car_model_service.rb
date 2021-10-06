class CarModelService

  def self.call(model)
    models = {
    'focus' => 'Focus',
    'IMPALA' => 'Impala',
    'focus se' => 'Focus',
    }
    return models[model] || model 
  end

end
