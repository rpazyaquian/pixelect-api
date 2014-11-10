FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.paragraph }
    image_set
    comment
  end

end
