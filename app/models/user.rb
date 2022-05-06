class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  validates :Name, presence: true
  validates_numericality_of :PostsCounter, only_integer: true, greater_than_or_equal_to: 0

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
