# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

grant_url = "https://accounts.spotify.com/api/token"

RestClient.post(grant_url, headers= {}, body={})

url = "https://api.spotify.com/artists"

RestClient.get(url, header)

User.destroy_all
Artist.destroy_all
IsLike.destroy_all
User.destroy_all

user1 = User.create(first_name: 'Bob', last_name: 'Dole', user_name: 'BDole_juice', password: 'abc123')
user2 = User.create(first_name: 'Mary', last_name: 'Watkins', user_name: 'MJWat', password: 'abc123')
user3 = User.create(first_name: 'Jeff', last_name: 'Bridges', user_name: 'JeffB12', password: 'abc123')

jt = Artist.create(name:"Justin Timberlake")
mj = Artist.create(name: "Michael Jackson")

a1 = IsLike.create(liker: jt, liked: mj)
