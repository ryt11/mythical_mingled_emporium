FactoryGirl.define do
  factory :creature do
    sequence :breed do |n|
      "Breed #{n}"
    end
    price '10.00'
    description "This is a description"
    image_url "http://www.funny-emoticons.com/files/funny-animals/hybrid-animals/0.png"
  end
  factory :category do
  	sequence :name do |name|
  		"Category #{name}"
  	end
  end
end
