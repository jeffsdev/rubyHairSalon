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

delete("/stylists/:id") do
  @stylist =  Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id/edit_stylist') do
  @stylist =  Stylist.find(params.fetch("id").to_i())
  erb(:edit_stylist)
end

patch("/stylists/:id") do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  phone = params.fetch('phone')
  @stylists = Stylist.all()
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({first_name: first_name,
                         last_name: last_name,
                         phone: phone,
                         id: nil})
  erb(:success)
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

get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  erb(:client)
end

delete("/clients/:id") do
  @client =  Client.find(params.fetch("id").to_i())
  @client.delete()
  @clients = Client.all()
  erb(:clients)
end

get('/clients/:id/edit_client') do
  @client =  Client.find(params.fetch("id").to_i())
  erb(:edit_client)
end

patch("/clients/:id") do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  phone = params.fetch('phone')
  stylist_id = params.fetch('stylist_id').to_i()
  @clients = Client.all()
  @client = Client.find(params.fetch("id").to_i())
  @client.update({first_name: first_name,
                       last_name: last_name,
                       phone: phone,
                       id: nil,
                       stylist_id: stylist_id})
  erb(:success)
end
