class CreditCardPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
end
