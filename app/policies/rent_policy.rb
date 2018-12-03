class RentPolicy < ApplicationPolicy
  def create?
    user.present? && record.user == user
  end

  def index?
    user.present? && record.id == user.id
  end
end
