class AdminPermissionsUserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def index?
    @current_user&.authorized?(klass: 'AdminPermissionsUser', action: 'read')
  end

  def show?
    index?
  end

  def new?
    create?
  end

  def create?
    @current_user&.authorized?(klass: 'AdminPermissionsUser', action: 'create')
  end

  def edit?
    update?
  end

  def update?
    @current_user&.authorized?(klass: 'AdminPermissionsUser', action: 'update')
  end

  def destroy?
    @current_user&.authorized?(klass: 'AdminPermissionsUser', action: 'destroy')
  end
end
