module Services
  class DataFetcher
    class AccountBalance
      def self.perform_async(stripe_stripe_user_id)
        new(stripe_stripe_user_id).perform
      end

      private

      def fetch_data
        Stripe::Balance.retrieve(stripe_account: stripe_user_id)
      end
    end
  end
end
