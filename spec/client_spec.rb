require("rspec")
  require("pg")
  require("client")

  DB = PG.connect({:dbname => 'hair_salon_test'})

  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM clients *;")
    end
  end

  describe(Client) do
    describe("#==") do
      it("is the same client if it has the same properties") do
        client1 = Client.new({:name => "Joe"})
        client2 = Client.new({:name => "Joe"})
        expect(client1).to(eq(client2))
      end
    end

    describe(".all") do
      it("is empty at first") do
        expect(Client.all()).to(eq([]))
      end
    end

    describe("#save") do
      it("adds a client to the array of saved clients") do
        test_client = Client.new({:name => "Joe"})
        test_client.save()
        expect(Client.all()).to(eq([test_client]))
      end
    end




  end
