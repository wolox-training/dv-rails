class RentPolicy < ApplicationPolicy
  def create?
    record.user_id == user.id
  end
end
