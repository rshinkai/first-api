require 'test_helper'

class MockController
    include Authenticable
    # Getter and Setter for request field
    attr_accessor :request

    def initialize
        # Struct seems simple class to store data
        mock_request = Struct.new(:headers)
        self.request = mock_request.new(header: {})
    end
end

class AuthenticableTest < ActionDispath::IntegrationTest
    setup do
        @user = users(:one)
        @authentication = MockController.new
    end

    test "should get user from Authorization token" do
        @authentication.request.headers['Authorization'] = JsonWebToken.encode(user_id: @user.id)
        assert_not_nil @authentication.current_user
        assert_equal @user.id, @authentication.current_user.user_id
    end

    test "should not get user from empty Authorization token" do
        @authentication.request.headers['Authorization'] = nil
        assert_nil @authentication.current_user
    end
end
