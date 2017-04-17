DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

admin = User.create!(username: 'admin',
                    email: 'admin@admin.com',
                    password: 'admin',
                    password_confirmation: 'admin')
user = User.create!(username: 'user',
                    email: 'user@user.com',
                    password: 'user',
                    password_confirmation: 'user')

puts 'Users created'

Category.create!(name: 'humble')
Category.create!(name: 'regal')
Category.create!(name: 'untrustworthy')

puts 'Categories created'

Creature.create!(breed: 'Bab Finch',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/bab-finch.jpg'))
Creature.create!(breed: 'Llama Bun',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/bama.jpeg'))
Creature.create!(breed: 'Camel Retriever',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/camel-retriever.jpg'))
Creature.create!(breed: 'Teagle',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/eagle-terrier.jpg'))
Creature.create!(breed: 'Quackaphant',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/ele-duck.jpg'))
Creature.create!(breed: 'Frig',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/frig.jpg'))
Creature.create!(breed: 'Crog',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/frog-o-dile.jpg'))
Creature.create!(breed: 'Scrog',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/frog-pion.jpg'))
Creature.create!(breed: 'Gorillaphant',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/gorillaphant.jpg'))
Creature.create!(breed: 'Guinea Lion',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/guinea-lion.jpg'))
Creature.create!(breed: 'Hork',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/hork.jpg'))
Creature.create!(breed: 'Cowgaroo',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/kow.jpeg'))
Creature.create!(breed: 'Lion Jacket',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/lion-jacket.jpg'))
Creature.create!(breed: 'Elezard',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/lizardphant.jpg'))
Creature.create!(breed: 'Pig Bull',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/pig-bull.jpg'))
Creature.create!(breed: 'Chig',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/pimp.jpg'))
Creature.create!(breed: 'Pugrilla',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/pugrilla.jpg'))
Creature.create!(breed: 'Punny',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/punny.jpg'))
Creature.create!(breed: 'Rhinaroo',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/rhinaroo.jpeg'))
Creature.create!(breed: 'Shat',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/shark-cat.jpg'))
Creature.create!(breed: 'Sharkopotamus',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/sharkopotamus.jpg'))
Creature.create!(breed: 'Sherbil',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/sherbil.jpg'))
Creature.create!(breed: 'Durtle',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/tort-duck.jpg'))
Creature.create!(breed: 'Ursadile',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/ursadile.jpg'))
Creature.create!(breed: 'Zebrocerous',
                 description: 'Wild and free',
                 price: (rand(75) + 10).to_s,
                 image_url: File.join(Rails.root, '/app/assets/images/zebrocerous.jpg'))

Creature.all.each do |creature|
  creature.categories << Category.all.sample
end

puts 'Creatures associated with a category'

STATUSES = %w(ordered paid cancelled completed)
10.times do
  admin.orders.create!(total: rand(1000) + 1,
                      status: STATUSES.sample)
  user.orders.create!(total: rand(1000) + 1,
                      status: STATUSES.sample)
end

puts 'Orders created'

100.times do
  OrderCreature.create!(order: Order.all.sample, creature: Creature.all.sample, quantity: rand(5) + 1)
end

puts 'OrderCreatures created'
