# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Request.create(id: 2,
                clid: "abc1234",
                building: "Harris Hall",
                room: "360E",
                gender: "female",
                activated_at: Time.zone.now,
                activated: true)

60.times do |n|
  clid = Faker::Lorem.characters(3) + Faker::Number.number(4)
  gender = ["male","female"].sample
  room = Faker::Number.number(3) + ['E','W'].sample
  Request.create(id: n+3, clid: clid,
                building: ["Harris Hall","Conference Center","Legacy Park","Coronna Hall","Bonin Hall","Huger Hall","Baker Hall"].sample,
                room: [room].sample,
                gender: gender,
                activated_at: Time.zone.now,
                activated: true)
end

Administrator.create(id: 1, username: "kingofthehill",
                      password: "password",
                      password_confirmation: "password")
                      

