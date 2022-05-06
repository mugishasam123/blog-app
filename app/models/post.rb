class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_save :update_posts_counter

  validates :Title, length: { in: 1..250 }, presence: true, allow_blank: false
  validates_numericality_of :CommentsCounter, only_integer: true, greater_than_or_equal_to: 0
  validates_numericality_of :LikesCounter, only_integer: true, greater_than_or_equal_to: 0

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:PostsCounter)
  end
end
