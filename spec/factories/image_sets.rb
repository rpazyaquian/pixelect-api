FactoryGirl.define do
  factory :image_set do
    question { Faker::Lorem.sentence }
    user
  end

end
