FactoryGirl.define do
  factory :creature do
    sequence :breed do |n|
      "Breed #{n}"
    end
    price '10.00'
    description "This is a description"
    sequence :image_url do |n|
      "https://robohash.org/#{n}?set=set2"
    end
  end
  factory :category do
  	sequence :name do |name|
  		"Category #{name}"
  	end
  end
  factory :order do 
    user
    total '100.0'
    contents 'these are contents'
  end
  factory :user do 
    sequence :username do |username|
      "Bob #{username}"
    end
    email 'bob@ski.com'
    password 'bobs'
    password_confirmation 'bobs'
    role 'user'
  end
end
