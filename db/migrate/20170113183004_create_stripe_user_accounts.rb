class CreateStripeUserAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :stripe_user_accounts do |t|
      t.string :stripe_user_id
      t.column :balance, :json
      t.column :charges, :json
      t.column :disputes, :json
      t.column :refunds, :json
      t.column :subscriptions, :json
      t.column :transfers, :json
      t.column :bank_accounts, :json
      t.column :orders, :json
      t.column :returns, :json
      t.column :payment_methods, :json
    end
  end
end
