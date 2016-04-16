# Hair Salon
#### Week 3 - Ruby code review - Epicodus  
##### By Jeff Seymour


## Description
###### This is a small web app for the 3rd week code review for the Ruby course at Epicodus, using Ruby, SQL, and Postgres.

##### Objective
Create an app for a hair salon. The stylists at the salon work independently, so each client will belong to a single stylist (one stylist, many clients). Here are the user stories to complete:

As a salon owner, I want to view, add, update and delete stylists.  
As a salon owner, I want to view, add, update and delete clients.  
As a salon owner, I want to add clients to a stylist.

## Technologies Used
HTML, CSS, Ruby, Postgres, SQL, RSpec, Capybara, Sinatra.

## Installation
Clone repository.  
```bundle install```  
In PSQL:  
`CREATE DATABASE hair_salon;`  
`CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar, phone int);`  
`CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, phone int, stylist_id int);`  
For rspec to work:  
`CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon`
To launch app:  
```ruby app.rb```

## License
Copyright (c) 2016 Jeff Seymour

This software is licensed under the MIT license.
