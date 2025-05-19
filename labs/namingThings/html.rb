module Html
    def self.make_tag(name, attributes, type)
      tag = "<#{name}"
  
      attributes.each do |key, value|
        tag << " #{key}=\"#{value}\""
      end
  
      case type
      when :empty
        tag << ">"
      when :sandwich
        tag << ">"
        tag << "</#{name}>"
      when :selfclose
        tag << " />"
      end
  
      tag
    end
end