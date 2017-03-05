class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent,   class_name: 'Comment', foreign_key: 'parent_id'

  has_many   :children, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy

  validates :user, presence: true
  validates :post, presence: true
  validates :body, presence: true

  default_scope { order(:created_at)}

  self.per_page = 5
end
