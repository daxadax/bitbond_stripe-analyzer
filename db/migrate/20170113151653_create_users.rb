class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :access_token
      t.string :refresh_token
      t.string :stripe_publishable_key
      t.string :stripe_user_id
      t.string :account_scope
    end
  end
end
