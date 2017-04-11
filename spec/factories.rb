FactoryGirl.define do
  factory :creature do
    sequence :breed do |n|
      "Breed #{n}"
    end
    price '10.00'
  end
  factory :category do
  	sequence :name do |name|
  		"Category #{name}"
  	end
  end
end