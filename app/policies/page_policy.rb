class PagePolicy < Struct.new(:user, :page)
  attr_reader :user, :page

  def initialize(user, page)
    @user = user
    @page = page
  end

  def home?
    true
  end

  def show?
    @user
  end
end
