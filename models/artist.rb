require_relative("../db/sql_runner")
require_relative("album")

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    artist_hash = SqlRunner.run(sql, values)
    @id = artist_hash[0]["id"].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    album_hashes = SqlRunner.run(sql, values)
    albums = album_hashes.map { |album_hash| Album.new(album_hash) }
    return albums
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist)}
  end


end
