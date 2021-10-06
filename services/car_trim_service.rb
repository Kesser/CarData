class CarTrimService

  def self.call(trim)
    return nil if trim == "blank"
    trims = {
      'st' => 'ST',
      'se' => 'SE',
    }
    return trims[trim] || trim
  end

end
