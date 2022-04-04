class Post < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :post_tags, through: :taggings, source: :tag
end
