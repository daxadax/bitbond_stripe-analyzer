class User < ActiveRecord::Base
  def self.create_from_token(token)
    attributes = {
      access_token:            token['access_token'],
      account_scope:           token['scope'],
      refresh_token:           token['refresh_token'],
      stripe_publishable_key:  token['stripe_publishable_key'],
      stripe_user_id:          token['stripe_user_id']
    }

    create(attributes)
  end
end
