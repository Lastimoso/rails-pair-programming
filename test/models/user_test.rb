require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(
      first_name: "Pepe",
      last_name: "Grillo",
      email: "pepegrillo@gmail.com",
      password: "password",
    )
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should not be valid without email" do
    @user.email = nil

    assert_invalid @user, email: :blank
  end

  test "should not be valid with malformed email" do
    @user.email = "pepegmail"

    assert_invalid @user, email: :invalid
  end

  test "should not be valid without first_name" do
    @user.first_name = nil

    assert_invalid @user, first_name: :blank
  end

  test "should not be valid without last_name" do
    @user.last_name = nil

    assert_invalid @user, last_name: :blank
  end
end
