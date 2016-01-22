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




end