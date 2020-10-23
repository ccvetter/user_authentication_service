require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not create user without email or password" do
    user = User.new
    assert_not user.save
  end

  test "should not create user without password" do
    user = User.new(email: "test@test.com")
    assert_not user.save 
  end

  test "should create user with email and password" do
    user = User.new(email: "test@test.com", password: "1234")
    assert user.save
  end
end
