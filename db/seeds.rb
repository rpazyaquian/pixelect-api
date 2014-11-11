# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = FactoryGirl.create(:user, email: "user1@example.com")
user2 = FactoryGirl.create(:user, email: "user2@example.com")

image_set = FactoryGirl.create(:image_set, user: user1)

images = FactoryGirl.create_list(:image, 3, image_set: image_set)

comments = FactoryGirl.create_list(:comment, 5, user: user1, image_set: image_set)