module Services
  class DataAnalyst
    class AverageOutgoing
      def self.perform_async(stripe_user_id)
        new(stripe_user_id).perform
      end
    end
  end
end
