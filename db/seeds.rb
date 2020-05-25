# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artist.destroy_all
IsLike.destroy_all
User.destroy_all

jt = Artist.create(name:"Justin Timberlake")
mj = Artist.create(name: "Michael Jackson")

a1 = IsLike.create(liker: jt, liked: mj)