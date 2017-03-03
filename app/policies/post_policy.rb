class PostPolicy < ApplicationPolicy
  def index?
    !user.nil?
  end

  def new?
    !user.nil?
  end

  def create?
    !user.nil?
  end
end
