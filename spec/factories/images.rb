FactoryGirl.define do
  factory :image do
    url { Faker::Internet.url }
    image_set
  end

end
