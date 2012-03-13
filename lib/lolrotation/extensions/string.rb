class String
  def addbs
    return "" if self.length == 0
    self[-1] == File::SEPARATOR ? self : self + File::SEPARATOR
  end
end

