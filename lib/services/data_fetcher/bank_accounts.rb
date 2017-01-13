module Services
  class DataFetcher
    class BankAccounts
      def self.perform_async(stripe_user_id)
        new(stripe_user_id).perform
      end

      private

      def fetch_data
        # to be implemented
      end
    end
  end
end
