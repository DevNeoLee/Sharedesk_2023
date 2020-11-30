# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


25.times do
    Room.create(user_id: 1, home_type: "house", room_type: "good_room", accomodate: "yes", bed_room: 1, bath_room: 2, listing_name: "good", summary: "yeah I told you it's a good room", address: "canada")
end

