class RentPolicy < ApplicationPolicy
  def create?
    record.user_id == user.id
  end

  def index?
    user.present? && record.user == user
  end
end
