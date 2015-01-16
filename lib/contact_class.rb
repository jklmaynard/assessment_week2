class Contact
  @@phone_book = []
  attr_reader(:name, :number)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @number = attributes.fetch(:number)
    @id = @@phone_book.length().+(1)
  end

  define_method(:get_number) do
    @number
  end

  define_method(:id) do
    @id
  end

  define_method(:edit_id) do
    @id = new_id
  end

  define_method(:add_contact) do
    @@phone_book.push(self)
  end

  define_singleton_method(:clear) do
    @@phone_book = []
  end

  define_singleton_method(:all) do
    @@phone_book
  end

  define_singleton_method(:find) do |identification_number|
    found_contact = nil
    @@phone_book.each() do |contact|
      if contact.id().eql?(identification_number.to_i)
        found_contact = contact
      end
    end
    found_contact
  end


end
