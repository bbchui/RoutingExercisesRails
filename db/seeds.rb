# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#ranelle = User.create!(username: "Icilby")
#
art1 = Artwork.find(1)
art2 = Artwork.find(2)
art3 = Artwork.find(3)
art4 = Artwork.find(4)
art5 = Artwork.find(5)

# share0 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: 6)
# share1 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: 7)
# share2 = ArtworkShare.create!(artwork_id: art2.id, viewer_id: 5)
# share3 = ArtworkShare.create!(artwork_id: art3.id, viewer_id: 6)
# share4 = ArtworkShare.create!(artwork_id: art4.id, viewer_id: 7)
# share5 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: 5)


Comment.create!(user_id: 5, artwork_id: 1, body: "this sucks >_>")
Comment.create!(user_id: 5, artwork_id: 2, body: "this sucks >_>")
Comment.create!(user_id: 5, artwork_id: 3, body: "this sucks >_>")
Comment.create!(user_id: 6, artwork_id: 1, body: "this sucks <('.')>")
Comment.create!(user_id: 6, artwork_id: 2, body: "this sucks <('.')>")
Comment.create!(user_id: 6, artwork_id: 3, body: "this sucks <('.')>")
Comment.create!(user_id: 7, artwork_id: 4, body: "this sucks >_>")
