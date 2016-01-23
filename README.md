# Hair Salon

#### Week 3 - Ruby code review for Epicodus

#### By Jeff Seymour

## Description
This is a small web app for the 3rd week code review for the Ruby course at Epicodus.
Create an app for a hair salon. The stylists at the salon work independently, so each client will belong to a single stylist (one stylist, many clients). Here are the user stories to complete:

As a salon owner, I want to view, add, update and delete stylists.
As a salon owner, I want to view, add, update and delete clients.
As a salon owner, I want to add clients to a stylist.

## Technologies Used
HTML, CSS, Ruby, rspec, capybara, sinatra, heroku.

##Known Bugs
Clients are not getting tied to stylists in the SQL database.  3rd user story is failing.

## Installation
Clone repository.
In PSQL:
CREATE DATABASE hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar, phone int);
CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, phone int, stylist_id int);
For rspec to work: Create hair_salon_test database using hair_salon as template.

## License
Copyright (c) 2015 Jeff Seymour

This software is licensed under the MIT license.
