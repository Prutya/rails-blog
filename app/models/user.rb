class User < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :posts

  has_many :roles, through: :assignments

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

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
end
