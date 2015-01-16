require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/phone_class.rb")
require("./lib/contact_class.rb")
require("pry")


get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  name = params.fetch('contact')
  contact = Contact.new(name)
  contact.add_contact()
  @contacts = Contact.all()
  erb(:index)
end

post('/numbers') do
  home = params.fetch('home')
  @number = Phone.new(home)
  @number.save()
  @contact = Contact.find(params.fetch('contact_id').to_i)
  @contact.add_number(@number)
  erb(:contacts)
end

get('/numbers/:id') do
  @number = Phone.find(params.fetch('id').to_i())
  erb(:phones)
end

get('/contacts/:id')do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contacts)
end
