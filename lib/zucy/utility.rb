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

  # http://www.phonicsontheweb.com/plurals.php

  def pluralize
    gsub!(/([^aeiouy]|qu)y$/i, '\1ies')
    gsub!(/(ss|z|ch|sh|x)$/i, '\1es')
    gsub!(/(is)$/i, 'es')
    gsub!(/(f|fe)$/i, 'ves')
    gsub!(/(ex|ix)$/i, 'ices')
    gsub!(/(a)$/i, 'ae')
    gsub!(/(um|on)$/i, 'a')
    gsub!(/(us)$/i, 'i')
    gsub!(/(eau)$/i, 'eaux')
    gsub!(/([^sae])$/i, '\1s')
    self
  end

  def constantize
    Object.const_get(self)
  end
end
