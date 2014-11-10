class User < ActiveRecord::Base
  has_many :image_sets
  has_many :images, through: :image_sets
  has_many :comments, through: :image_sets
end
