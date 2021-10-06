class CarTrimService

  def self.call(trim)
<<<<<<< HEAD
    #The word "blank" should be returned as nil
=======
>>>>>>> origin/master
    return nil if trim == "blank"
    trims = {
      'st' => 'ST',
      'se' => 'SE',
    }
    return trims[trim] || trim
  end

end
