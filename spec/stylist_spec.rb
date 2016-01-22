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

end
