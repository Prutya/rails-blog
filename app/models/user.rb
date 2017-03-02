class User < ApplicationRecord
  has_many :assignments, dependent: :destroy

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

  protected

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end
end
