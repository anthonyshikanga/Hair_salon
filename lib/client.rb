class Client
  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      clients.push(Client.new({:name => description}))
    end
    clients
  end

  

  define_method(:save) do
    DB.exec("INSERT INTO clients (name) VALUES('#{@description}');")
  end

  end
