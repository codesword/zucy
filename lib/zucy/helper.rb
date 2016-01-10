class Object
  def self.const_missing(c)
    c = c.to_s
    require c.snakize
    c.constantize
  end
end