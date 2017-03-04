class User < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :roles, through: :assignments
  has_many :commented_posts, through: :comments, source: :post

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  before_create :set_default_role

  def admin?
    role?(:admin)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  protected

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end

  def set_default_role
    roles << Role.find_by(name: 'user')
  end
end
