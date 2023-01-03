# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

puts "Destroy all the DB"
Instrument.destroy_all
User.destroy_all
Category.destroy_all

puts "create all the categories"

Category.create(name: "String Instruments")
Category.create(name: "Drums")
Category.create(name: "Keyboard Instruments")
Category.create(name: "Wind Instruments")
Category.create(name: "Musician Accessories")
Category.create(name: "DJ Gear")

string_instruments = Category.find_by(name: "String Instruments")
drums = Category.find_by(name: "Drums")
keyboard_instruments = Category.find_by(name: "Keyboard Instruments")
wind_instruments = Category.find_by(name: "Wind Instruments")
musician_accessories = Category.find_by(name: "Musician Accessories")
dj_gear = Category.find_by(name: "DJ Gear")

puts "creating fake users"

alexandre = User.new(first_name: "Alexandre",
  last_name: "Falcão",
  email: "alexandrefalcao@email.com",
  password: "123456")
alexandre.save

matheus = User.new(first_name: "Matheus",
  last_name: "Araripe",
  email: "matheusararipe@email.com",
  password: "123456")
matheus.save

alexandre = User.find_by(email: "alexandrefalcao@email.com")
matheus = User.find_by(email: "matheusararipe@email.com")

puts "creating fake instruments"

file = URI.open("https://img.freepik.com/free-vector/guitar-realistic-isolated_1284-4825.jpg?w=740&t=st=1672769861~exp=1672770461~hmac=99ebaaca53a2c797a45680789e0c5351fce83cc9d35262706bb6406570353889")
instrument = Instrument.new(name: "Violão acústico Yamaha C40M - Nylon",
  description: "Violão em excelente estado, um dos mais vendidos e recomendados para iniciantes. com som limpo suave das cordas de nylon e bom para cantar junto.",
  category_id: string_instruments.id,
  user_id: alexandre.id,
  price: 10)
instrument.photo.attach(io: file, filename: "guitar.png", content_type: "image/png")
instrument.save

file = URI.open("https://img.freepik.com/free-photo/saxophone-white-background_1286-139.jpg?1&w=360&t=st=1672770087~exp=1672770687~hmac=dec8855edf8028af80614695a8f8b1ecb4d1b7a73921a8925ae78e1f557a4e37")
instrument = Instrument.new(name: "Saxofone Alto para estudantes - Weril Spectra",
  description: "É um Saxofone da marca Weril, Saxofone Alto, modelo Spectra A391 Estudante, excelente para quem está aprendendo e evoluindo no instrumento.",
  category_id: wind_instruments.id,
  user_id: alexandre.id,
  price: 10)
instrument.photo.attach(io: file, filename: "sax.png", content_type: "image/png")
instrument.save

file = URI.open("https://img.freepik.com/premium-photo/beautiful-electric-guitar-brown-color-standing-upright-isolated-white-background_193437-1964.jpg?w=360")
instrument = Instrument.new(name: "Violão acústico Tagima 12 cordas TJ212 - Aço",
  description: "Consagrado pelo gênero Folk e Blues, o violão de 12 cordas possui as 6 cordas tradicionais do violão, porém cada uma está duplicada.",
  category_id: string_instruments.id,
  user_id: matheus.id,
  price: 10)
instrument.photo.attach(io: file, filename: "guitar.png", content_type: "image/png")
instrument.save

file = URI.open("https://img.freepik.com/free-photo/violin-bow-white-background_1150-8456.jpg?w=740&t=st=1672770027~exp=1672770627~hmac=a3a9b3615163f54643f5ad8efc6dc3e548f88fed6bd1d09937d3c4612b4d0a5b")
instrument = Instrument.new(name: "Violino Eagle 431 - Modelo 3/4",
  description: "Violino da renomada e conhecida marca Eagle, é a principal opção para instrumento de entrada e intermediários. O modelo 431 é uma ótima opção para anos de prática.",
  category_id: string_instruments.id,
  user_id: matheus.id,
  price: 10)
instrument.photo.attach(io: file, filename: "violin.png", content_type: "image/png")
instrument.save

file = URI.open("https://img.freepik.com/premium-psd/isometric-drum-kit_28315-3228.jpg?w=740")
instrument = Instrument.new(name: "Bateria Acústica Pearl Rhythm Traveler Drum Set",
  description: "Ideal para estudo, viagens e apresentações pequenas em espaços pequenos. Preservando sonoridade e durabilidade, essa bateria não deixa a desejar",
  category_id: drums.id,
  user_id: matheus.id,
  price: 10)
instrument.photo.attach(io: file, filename: "drum.png", content_type: "image/png")
instrument.save

puts "Created all users, categories and isntruments"
