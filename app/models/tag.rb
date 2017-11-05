class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :microposts, through: :taggings
  validates :name, presence: true
end
