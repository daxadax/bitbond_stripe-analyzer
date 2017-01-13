module Services
  class DataFetcher
    def initialize(stripe_user_id)
      @stripe_user_id = stripe_user_id
    end

    def perform
      attributes = {
        stripe_user_id: stripe_user_id,
        data_type => fetch_data
      }

      StripeUserAccount.create_or_update(attributes)
    end

    private
    attr_reader :stripe_user_id

    def data_type
      self.class.name.downcase
    end
  end
end
