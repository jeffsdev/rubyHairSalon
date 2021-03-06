class Client
  attr_reader(:id, :first_name, :last_name, :phone, :stylist_id)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @phone = attributes.fetch(:phone)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  def ==(another_client)
    self.id() == another_client.id() &&
    self.first_name() == another_client.first_name() &&
    self.last_name() == another_client.last_name() &&
    self.phone().to_i == another_client.phone().to_i &&
    self.stylist_id().to_i == another_client.stylist_id().to_i
  end

  def self.all
    returned_clients = DB.exec("SELECT * FROM clients;")
    Client.map_results_to_objects(returned_clients)
  end

  def self.map_results_to_objects(returned_clients)
    clients = []
    returned_clients.each do |client|
      id = client.fetch('id').to_i()
      first_name = client.fetch('first_name')
      last_name = client.fetch('last_name')
      phone = client.fetch('phone')
      stylist_id = client.fetch('stylist_id').to_i()
      clients.push(Client.new({id: id,
                               first_name: first_name,
                               last_name: last_name,
                               phone: phone,
                               stylist_id: stylist_id}))
    end
    clients
  end

  def save
    result = DB.exec("INSERT INTO clients (first_name, last_name, phone, stylist_id) VALUES ('#{@first_name}', '#{@last_name}', '#{@phone}', '#{@stylist_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def delete
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  def update(attributes)
    @id = self.id()
    @first_name = attributes.fetch(:first_name, @first_name)
    @last_name = attributes.fetch(:last_name, @last_name)
    @phone = attributes.fetch(:phone, @phone)
    @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
    DB.exec("UPDATE clients SET first_name = '#{@first_name}', last_name = '#{@last_name}', phone = '#{@phone}', stylist_id = '#{@stylist_id}' WHERE id = #{self.id()};")
  end


  def self.find(id)
    found_client = nil
    Client.all().each() do |client|
      if client.id().==(id)
        found_client = client
      end
    end
    found_client
  end
end
