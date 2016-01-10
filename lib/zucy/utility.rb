class String
  def snakize
    gsub!("::", "/")
    gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
    gsub!(/([a-z\d])([A-Z])/, '\1_\2')
    tr!("-", "_")
    downcase!
    self
  end

  def camelize
    return self if self !~ /_/ && self =~/[A-Z]+.*/
    split('_').map{ |str| str.capitalize }.join
  end
end
