require('spec_helper')
require('pry')

describe(Stylist) do
  describe('#==') do
    it('returns same stylist if they have the same first name') do
      stylist1 = Stylist.new({id: nil,
                              first_name: 'Ashley',
                              last_name: 'Smith',
                              phone: '1113335555'})
      stylist2 = Stylist.new({id: nil,
                              first_name: 'Ashley',
                              last_name: 'Smith',
                              phone: '1113335555'})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('lets you save stylists to the database') do
      stylist1 = Stylist.new({id: nil,
                              first_name: 'Ashley',
                              last_name: 'Smith',
                              phone: '1113335555'})
      stylist1.save()
      expect(Stylist.all()).to(eq([stylist1]))
    end
  end

  describe('#delete') do
    it('lets you delete stylists from the database') do
      stylist1 = Stylist.new({id: nil,
                              first_name: 'Ashley',
                              last_name: 'Smith',
                              phone: '1113335555'})
      stylist1.save()
      stylist2 = Stylist.new({id: nil,
                              first_name: 'Liz',
                              last_name: 'Jones',
                              phone: '1117774444'})
      stylist2.save()
      stylist1.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

  describe("#update") do
    it("lets you update stylists in the database") do
      stylist1 = Stylist.new({id: nil,
                              first_name: 'Ashley',
                              last_name: 'Smith',
                              phone: '1113335555'})
      stylist1.save()
      stylist1.update({:id => nil, :first_name => 'Ashleyyy', :last_name => 'Smithhh', :phone => '123'})
        expect(stylist1.first_name()).to(eq('Ashleyyy'))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID") do
      test_stylist = Stylist.new({id: nil,
                              first_name: 'Ashley',
                              last_name: 'Smith',
                              phone: '1113335555'})
      test_stylist.save()
      test_stylist2 = Stylist.new({id: nil,
                              first_name: 'Liz',
                              last_name: 'Jones',
                              phone: '1117774444'})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end


  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({id: nil,
                              first_name: 'Ashley',
                              last_name: 'Smith',
                              phone: '1113335555'})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end



  describe("#clients") do

    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({id: nil,
                              first_name: 'Ashley',
                              last_name: 'Smith',
                              phone: '11133'})
      test_stylist.save()
      test_client = Client.new({id: nil,
                            first_name: 'Sarah',
                            last_name: 'McClient',
                            phone: '11133',
                            stylist_id: test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({id: nil,
                            first_name: 'Amy',
                            last_name: 'Dougew',
                            phone: '11144',
                            stylist_id: test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end


end
