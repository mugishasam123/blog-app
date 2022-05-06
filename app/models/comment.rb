class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :author_id, presence: true
  validates :post_id, presence: true

  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:CommentsCounter)
  end
end
