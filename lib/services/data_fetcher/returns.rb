module Services
  class DataFetcher
    class Returns
      def self.perform_async(stripe_user_id)
        new(stripe_user_id).perform
      end

      private

      def fetch_data
        Stripe::Return.list(stripe_account: stripe_user_id)
      end
    end
  end
end
