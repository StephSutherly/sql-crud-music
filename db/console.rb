require("pry")
require_relative("../models/artist")
require_relative("../models/album")

artist1 = Artist.new({"name" => "Laura Marling"})
artist2 = Artist.new({"name" => "Artic Monkeys"})
artist3 = Artist.new({"name" => "Glass Animals"})

artist1.save
artist2.save
artist3.save

album1 = Album.new({
  "title" => "Alas, I cannot swim",
  "genre" => "folk",
  "artist_id" => artist1.id
  })

album2 = Album.new({
  "title" => "I speak because I can",
  "genre" => "folk",
  "artist_id" => artist1.id
  })

album1.save
album2.save

binding.pry
nil
