class Post < ApplicationRecord
  before_validation :set_default_values

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  after_save :update_counter

  def update_counter
    author.update(posts_counter: author.posts.count)
  end

  def five_recent_comments
    comments.limit(5).order(created_at: :DESC)
  end

  private

  def set_default_values
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
