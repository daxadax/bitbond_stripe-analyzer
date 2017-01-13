class StripeUserAccount < ActiveRecord::Base
  def self.create_or_update(attributes)
    existing = find_by(stripe_user_id: attributes[:stripe_user_id])
    existing ? existing.update(attributes) : create!(attributes)
  end
end
