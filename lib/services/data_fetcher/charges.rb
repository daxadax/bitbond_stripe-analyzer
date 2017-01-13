module Services
  class DataFetcher
    class Charges
      def self.perform_async(stripe_user_id)
        new(stripe_user_id).perform
      end

      private

      def fetch_data
        Stripe::Charge.list(stripe_account: stripe_user_id)
      end
    end
  end
end
