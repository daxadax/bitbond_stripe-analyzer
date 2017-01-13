require_relative '../spec_helper'

class UserSpec < BaseSpec
  let(:token) do
    {
      "access_token"=>"sk_test_QqCrbQLg1A8tGBLS77Vjgg84",
      "livemode"=>false,
      "refresh_token"=>"rt_9vMQJ681BsVvm7xOV7UhVmBNOJLeL6wVWsqeXzxW9jfWEb46",
      "token_type"=>"bearer",
      "stripe_publishable_key"=>"pk_test_1zBhhpf5dligz4mj8THV9l3j",
      "stripe_user_id"=>"acct_19bVEDFmLQzWOHLh",
      "scope"=>"read_only"
    }
  end

  describe 'validations' do
    it 'tests validations' do
      skip
    end
  end

  describe 'create_from_token' do
    it 'saves the user information to the db' do
      User.create_from_token(token)

      assert_equal User.last.access_token,            token['access_token']
      assert_equal User.last.refresh_token,           token['refresh_token']
      assert_equal User.last.stripe_publishable_key,  token['stripe_publishable_key']
      assert_equal User.last.stripe_user_id,          token['stripe_user_id']
      assert_equal User.last.account_scope,           token['scope']
    end
  end
end
