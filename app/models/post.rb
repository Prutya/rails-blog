class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :commenters, through: :comments, source: :user

  validates :user, presence: true

  default_scope { order(created_at: :desc) }

  self.per_page = 5

  def full_title
    "##{id} #{title}"
  end
end
