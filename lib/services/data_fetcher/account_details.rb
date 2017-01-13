module Services
  class DataFetcher
    class AccountDetails
      def self.perform_async(stripe_user_id)
        new(stripe_user_id).perform
      end

      private

      def fetch_data
        Stripe::Account.retrieve(stripe_user_id)
      end
    end
  end
end
