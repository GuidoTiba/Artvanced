require "open-uri"

# seeds  Users

puts "borrando datos"

Purchase.destroy_all
Artwork.destroy_all
User.destroy_all

puts "Sembrando usuarios"
10.times do
  user_new = User.create!(
    email:   Faker::Internet.email,
    password: "123456",
  )
end

puts "Usuarios terminados, Artwor iniciados"

# seeds  Artworks

10.times do
  artwork_new = Artwork.new(
    title:   Faker::Book.title,
    on_sale: [true, false].sample,
    technique: Artwork::TECHNIQUES.sample,
    price: rand(599),
    user_id: User.all.sample.id
  )
  
  file = URI.open('https://source.unsplash.com/1600x900/?artwork,painting')
  artwork_new.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  artwork_new.save
end

  puts "Artworks terminados, Purchase iniciados"
# seeds de

5.times do
  purchase_new = Purchase.create!(
    user_id: User.all.sample.id,
    artwork_id: Artwork.all.sample.id,
    domicilio: Faker::Address.full_address
  )
end

puts "Seeds terminados"
