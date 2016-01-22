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

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist)
end

#------------Clients-------------------------


get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

get('/clients/client_form') do
  erb(:client_form)
end

post('/clients') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  phone = params.fetch('phone')
  stylist_id = params.fetch('stylist_id').to_i()
  client = Client.new({first_name: first_name,
                       last_name: last_name,
                       phone: phone,
                       id: nil,
                       stylist_id: stylist_id})
  client.save()
  erb(:success)
end
