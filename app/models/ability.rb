class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    if user.admin?
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
      can :manage, :all
    else
      can [:index, :show, :create, :new], Post
      can [:update, :edit, :destroy], Post do |post|
        post.user_id == user.id
      end

      can [:index, :create, :new], Comment
      can [:update, :edit, :destroy], Comment do |comment|
        comment.user_id == user.id
      end
    end
  end
end
