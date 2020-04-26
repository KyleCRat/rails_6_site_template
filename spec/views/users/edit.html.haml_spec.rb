require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[middle_name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[password_confirmation]"

      assert_select "input[name=?]", "user[email]"
    end
  end
end
