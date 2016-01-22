require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/stylist_form') do
  erb(:stylist_form)
end

post('/stylists') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  phone = params.fetch('phone')
  stylist = Stylist.new({first_name: first_name,
                         last_name: last_name,
                         phone: phone,
                         id: nil})
  stylist.save()
  erb(:success)
end

get('/clients') do
  erb(:clients)
end
