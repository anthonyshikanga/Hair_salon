require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/client")
  require("pg")

  DB = PG.connect({:dbname =>"hair_salon"})
  
