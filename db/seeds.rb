require "open-uri"

# seeds  Users

puts "borrando datos"

Purchase.destroy_all
Artwork.destroy_all
User.destroy_all

puts "Sembrando usuarios"
15.times do
  user_new = User.create!(
    email:   Faker::Internet.email,
    password: "123456",
    firstname:Faker::Name.first_name,
    lastname: Faker::Name.last_name,
  )
end

puts "Usuarios terminados, Artwork iniciados"

# seeds  Artworks

10.times do
  artwork_new = Artwork.new(
    title:   Faker::Book.title,
    on_sale: [true, false].sample, 
    price: rand(20),
    user_id: User.all.sample.id,
    description: Faker::Lorem.sentence(word_count: 25),
    technique: "painting"
  )
  file = URI.open('https://source.unsplash.com/1600x900/?artwork,painting')
  artwork_new.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  artwork_new.save
  puts "pintura"
end

10.times do
  artwork_new = Artwork.new(
    title:   Faker::Book.title,
    on_sale: [true, false].sample, 
    price: rand(20),
    user_id: User.all.sample.id,
    description: Faker::Lorem.sentence(word_count: 25),
    technique: "sculpture"
  )
  file = URI.open('https://source.unsplash.com/1600x900/?artwork,sculpture')
  artwork_new.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  artwork_new.save
  puts "Sculpture"
end

10.times do
  artwork_new = Artwork.new(
    title:   Faker::Book.title,
    on_sale: [true, false].sample, 
    price: rand(20),
    user_id: User.all.sample.id,
    description: Faker::Lorem.sentence(word_count: 25),
    technique: "digital"
  )
  file = URI.open('https://source.unsplash.com/1600x900/?digital-art')
  artwork_new.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  artwork_new.save
  puts "digital"
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
