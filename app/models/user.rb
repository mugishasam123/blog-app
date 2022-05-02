class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependant: :destroy
  has_many :comments, foreign_key: 'author_id', dependant: :destroy
  has_many :likes, foreign_key: 'author_id', dependant: :destroy

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
