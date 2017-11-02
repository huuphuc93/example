class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  mount_uploader :picture, PictureUploader
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
  def self.tagged_with(name)
    Tag.find_by_name!(name).microposts
  end
  
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name).first_or_create!
    end
  end
  
  def all_tags
    tags.map(&:name).join(", ")
  end
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
