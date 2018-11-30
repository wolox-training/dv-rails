class UserPolicy < ApplicationPolicy
  def index?
    user && user.id == record
  end
end