DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

cute = Category.create(name: 'cute')
scary = Category.create(name: 'scary')
funny = Category.create(name: 'funny')

user1 = User.create(username: 'Danny',
                    email: 'danny@danny.com',
                    password: 'dan',
                    password_confirmation: 'dan')
user2 = User.create(username: 'Sam',
                    email: 'sam@sam.com',
                    password: 'sam',
                    password_confirmation: 'sam')

order1 = user1.orders.create(total: '100.00',
                             status: 'ordered')
order2 = user1.orders.create(total: '30.00',
                             status: 'paid')
order3 = user2.orders.create(total: '140.00',
                             status: 'cancelled')

creature1 = cute.creatures
                .create(breed: 'catdog',
                        description: 'Wild and free',
                        price: '25.01',
                        image_url: 'https://s-media-cache-ak0.pinimg.com/originals/be/1c/24/be1c24fd15d3551dcd17167a71284b61.jpg')
creature2 = cute.creatures
                .create(breed: 'squirrelfrog',
                        description: 'Cute and jumpy',
                        price: '10.11',
                        image_url: 'https://img2.cgtrader.com/galleries/479/large_81bbfe85-74e3-4e37-a7a1-8d43d21ceaf0.png')
creature3 = scary.creatures
                 .create(breed: 'batlion',
                         description: 'Flies and kills you',
                         price: '15.00',
                         image_url: 'https://s-media-cache-ak0.pinimg.com/736x/4b/4a/88/4b4a8824a4fbf8f6427839e3422a3bb5.jpg')
creature4 = scary.creatures
                 .create(breed: 'catspider',
                         description: 'Hairy with an attitude',
                         price: '78.88',
                         image_url: 'https://s-media-cache-ak0.pinimg.com/originals/93/0b/9e/930b9ebe187c9da6e0ba80c45c63bd4d.jpg')
creature5 = funny.creatures
                 .create(breed: 'wolfbird',
                         description: 'Bared teeth and wings',
                         price: '10.99',
                         image_url: 'https://s-media-cache-ak0.pinimg.com/564x/4e/40/71/4e40713eaad4e47d1de4fff96487f8c1.jpg')
creature6 = funny.creatures
                 .create(breed: 'lemurdog',
                         description: 'Puppy dog lemur eyes',
                         price: '149.88',
                         image_url: 'https://s-media-cache-ak0.pinimg.com/564x/85/d0/92/85d0925ad5a76091765f9f86d3f14fbb.jpg')

OrderCreature.create(order: order1, creature: creature1, quantity: 2)
OrderCreature.create(order: order1, creature: creature2, quantity: 1)
OrderCreature.create(order: order1, creature: creature5, quantity: 4)
OrderCreature.create(order: order2, creature: creature1, quantity: 1)
OrderCreature.create(order: order3, creature: creature3, quantity: 2)
OrderCreature.create(order: order3, creature: creature4, quantity: 3)
OrderCreature.create(order: order3, creature: creature5, quantity: 1)
OrderCreature.create(order: order3, creature: creature6, quantity: 1)
