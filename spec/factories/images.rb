FactoryGirl.define do
  factory :image do
    url { Faker::Avatar.image }
    image_set
  end

end
