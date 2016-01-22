require('spec_helper')

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


end
