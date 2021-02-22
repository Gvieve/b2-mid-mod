Mechanic.destroy_all

avery = Mechanic.create!(name: "Avery Jones", years_experience: 8)
herbert = Mechanic.create!(name: "Herbert Fallon", years_experience: 3)
elon = Mechanic.create!(name: "Elon Musk", years_experience: 11)
sarah = Mechanic.create!(name: "Sarah Ledbetter", years_experience: 5)
hurler = avery.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
tumbler = avery.rides.create!(name: "The Tumbler", thrill_rating: 6, open: true)
xcelerator = elon.rides.create!(name: "The Xcelerator", thrill_rating: 9, open: true)
herbert.rides << xcelerator
doom = herbert.rides.create!(name: "Tower of Doom", thrill_rating: 8, open: false)
dragon = sarah.rides.create!(name: "The Dragon", thrill_rating: 4, open: true)
