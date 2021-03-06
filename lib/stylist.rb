class Stylist
  attr_reader(:id, :first_name, :last_name, :phone)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @phone = attributes.fetch(:phone)
  end

  def ==(another_stylist)
    self.id() == another_stylist.id() &&
    self.first_name() == another_stylist.first_name() &&
    self.last_name() == another_stylist.last_name() &&
    self.phone().to_i == another_stylist.phone().to_i
  end

  def self.all
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    Stylist.map_results_to_objects(returned_stylists)
  end

  def self.map_results_to_objects(returned_stylists)
    stylists = []
    returned_stylists.each do |stylist|
      id = stylist.fetch("id").to_i()
      first_name = stylist.fetch('first_name')
      last_name = stylist.fetch('last_name')
      phone = stylist.fetch('phone')
      stylists.push(Stylist.new({id: id,
                                 first_name: first_name,
                                 last_name: last_name,
                                 phone: phone}))
    end
    stylists
  end

  def save
    result = DB.exec("INSERT INTO stylists (first_name, last_name, phone) VALUES ('#{@first_name}', '#{@last_name}', '#{@phone}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end


  def update(attributes)
    @id = self.id()
    @first_name = attributes.fetch(:first_name, @first_name)
    @last_name = attributes.fetch(:last_name, @last_name)
    @phone = attributes.fetch(:phone, @phone)
    DB.exec("UPDATE stylists SET first_name = '#{@first_name}', last_name = '#{@last_name}', phone = '#{@phone}' WHERE id = #{self.id()};")
  end


  def self.find(id)
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  def clients
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      first_name = client.fetch('first_name')
      last_name = client.fetch('last_name')
      phone = client.fetch('phone')
      id = client.fetch('id')
      stylist_id = client.fetch("stylist_id").to_i()
      stylist_clients.push(Client.new({first_name: first_name,
                           last_name: last_name,
                           phone: phone,
                           id: id.to_i(),
                           stylist_id: stylist_id}))
    end
    stylist_clients
  end
end
