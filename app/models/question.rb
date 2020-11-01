class Question < ApplicationRecord
  has_many :comments
  has_many :escalatings
  belongs_to :user
end
