require("rspec")
  require("pg")
  require("stylist")

  DB = PG.connect({:dbname => 'hair_salon_test'})

  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM stylists *;")
    end
  end

  describe(Stylist) do
    describe("#==") do
      it("is the same stylist if it has the same properties") do
        stylist1 = Stylist.new({:name => "Mary",:id =>nil})
        stylist2 = Stylist.new({:name => "Mary",:id =>nil})
        expect(stylist1).to(eq(stylist2))
      end
    end

    describe(".all") do
      it("is empty at first") do
        expect(Stylist.all()).to(eq([]))
      end
    end

    describe("#save") do
      it("adds a stylist") do
        test_stylist = Stylist.new({:name => "Mary",:id =>nil})
        test_stylist.save()
        expect(Stylist.all()).to(eq([test_stylist]))
      end
    end

    describe("#name") do
      it("shows you name of stylist") do
        test_stylist = Stylist.new({:name => "Mary",:id =>nil})
        test_stylist.save()
        expect(Stylist.name()).to(eq("Mary"))
      end
    end


    describe("#id") do
      it("sets id") do
        test_stylist = Stylist.new({:name => "Mary", :id =>nil})
        test_stylist.save()
        expect(Stylist.id()).to(be_an_instance_of(Fixnum))
      end
    end
    
  end
