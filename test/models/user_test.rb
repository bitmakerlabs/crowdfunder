require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "regular user factory" do
    new_user = build(:user)
    assert new_user.valid?
  end

  test "project owner user factory" do
    new_user = build(:project_owner)
    assert new_user.valid?
  end

  test "email must be unique" do
    skip
    user = User.create(email: "bettymaker@gmail.com", password: "12345678", password_confirmation: "12345678")
    user2 = User.new(email: "bettymaker@gmail.com", password: "00000000", password_confirmation: "00000000")
    refute user2.valid?
  end

  test "user must include password_confirmation on create" do
    skip
    user = User.new(email: "bettymaker@gmail.com", password: "12345678")
    refute user.valid?
  end

  test "password must match confirmation" do
    skip
    user = User.new(email: "bettymaker@gmail.com", password: "12345678", password_confirmation: "87654321")
    refute user.valid?
  end

  test "password must be at least 8 characters long" do
    skip
    user = User.new(email: "bettymaker@gmail.com", password: "1234", password_confirmation: "1234")
    refute user.valid?
  end
end
