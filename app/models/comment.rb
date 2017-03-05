class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user, presence: true
  validates :post, presence: true
  validates :body, presence: true

  default_scope { order(created_at: :desc) }

  self.per_page = 5
end
