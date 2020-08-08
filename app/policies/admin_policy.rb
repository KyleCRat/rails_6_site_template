class AdminPolicy < ApplicationPolicy
  attr_reader :current_user, :admin

  def initialize(current_user, admin)
    @current_user = current_user
    @admin = admin
  end

  def show?
    @current_user&.authorized?(klass: 'Admin', action: 'read')
  end
end
