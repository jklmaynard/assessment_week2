class Phone

  attr_reader(:number)

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
  end

  

end
