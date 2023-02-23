require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'user with valid email should be valid' do
    user = User.new(email: 'test@test.com', password_digest: 'hashed_password')
    assert user.valid?
  end

  test 'user with invalid email should be invalid' do
    user = User.new(email: 'test', password_digest: 'hashed_password')
    assert_not user.valid?
  end

  test 'user with not unique password should be invalid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: 'hashed_password')
    assert_not user.valid?
  end

  test "destroy user should destroy linked products" do
    assert_difference('Product.count', -1) do
      users(:one).destroy
    end
  end
end
