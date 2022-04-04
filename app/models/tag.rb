class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tagged_posts, through: :taggings, source: :post

  validates :name, presence: true, uniqueness: true
end
