class Comment < ActiveRecord::Base
  has_many :comments
  belongs_to :image_set
  belongs_to :comment
  has_one :user, through: :image_set
end
