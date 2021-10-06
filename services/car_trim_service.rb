class CarTrimService

  def self.call(trim)
    #The word "blank" should be returned as nil
    return nil if trim == "blank"
    trims = {
      'st' => 'ST',
      'se' => 'SE',
    }
    return trims[trim] || trim
  end

end
