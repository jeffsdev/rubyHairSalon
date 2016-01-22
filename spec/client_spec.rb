require('spec_helper')

describe(Client) do
  describe('#==') do
    it('returns same client if they have the same first name') do
      client1 = Client.new({id: nil,
                            first_name: 'Sarah',
                            last_name: 'McClient',
                            phone: '1113335511',
                            stylist_id: 1})
      client2 = Client.new({id: nil,
                            first_name: 'Sarah',
                            last_name: 'McClient',
                            phone: '1113335511',
                            stylist_id: 1})
      expect(client1).to(eq(client2))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('lets you save clients to the database') do
      client1 = Client.new({id: nil,
                            first_name: 'Sarah',
                            last_name: 'McClient',
                            phone: '1113335511',
                            stylist_id: 1})
      client1.save()
      expect(Client.all()).to(eq([client1]))
    end
  end

  describe('#delete') do
    it('lets you delete clients from the database') do
      client1 = Client.new({id: nil,
                            first_name: 'Sarah',
                            last_name: 'McClient',
                            phone: '1113335511',
                            stylist_id: 1})
      client1.save()
      client2 = Client.new({id: nil,
                            first_name: 'Kate',
                            last_name: 'Renee',
                            phone: '1113337777',
                            stylist_id: 1})
      client2.save()
      client1.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end

end
