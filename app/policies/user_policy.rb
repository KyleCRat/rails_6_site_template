class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def index?
    true
  end

  def show?
    true
  end

  def me?
    @current_user
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @current_user == @user || @current_user&.authorized?(klass: 'User', action: 'update')
  end

  def edit?
    update?
  end

  def destroy?
    @current_user&.authorized?(klass: 'User', action: 'destroy')
  end

  def none?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
