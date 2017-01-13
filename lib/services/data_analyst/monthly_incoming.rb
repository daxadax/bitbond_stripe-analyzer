module Services
  class DataAnalyst
    class MonthlyIncoming
      def self.perform_async(stripe_user_id)
        new(stripe_user_id).perform
      end
    end
  end
end
