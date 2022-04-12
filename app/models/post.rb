class Post < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :post_tags, through: :taggings, source: :tag
  belongs_to :user

  def save_with(tag_names)
    #複数のSQL処理を一つのトランザクションにまとめる
    #タグとPostが同時に作成される処理のため、複数のSQLが走るから
    ActiveRecord::Base.transaction do
      #作成するタグの値がすでに存在していればそのタグを返し、存在していなければインスタンス化するメソッド
      #タグの名前を重複するのを防ぐことができる
      self.post_tags = tag_names.map { |name| Tag.find_or_initialize_by(name: name.strip) }
      save!
    end
    true

  rescue StandardError
    false
  end
end
