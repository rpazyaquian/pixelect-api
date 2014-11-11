FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.paragraph }
    image_set
  end

end
