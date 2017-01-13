module Services
  class StripeDataHandler
    def self.perform_async(user_id) #would spawn a background job
      new(user_id).perform
    end

    def initialize(user_id, services = {})
      @stripe_user_id = User.find(user_id).stripe_user_id
      @data_analysts = services.fetch(:analysts) { default_data_analysts }
      @data_fetchers = services.fetch(:fetchers) { default_data_fetchers }
    end

    def perform
      data_fetchers.each { |df| df.perform_async(stripe_user_id) }
      data_analysts.each { |da| da.perform_async(stripe_user_id) }
    end

    private
    attr_reader :data_analysts, :data_fetchers, :stripe_user_id

    def default_data_analysts
      [
        DataAnalyst::MonthlyNumberOfCharges,
        DataAnalyst::MonthlyIncoming,
        DataAnalyst::MonthlyOutgoing,
        DataAnalyst::YearOverYearChange,
        DataAnalyst::AverageNumberOfCharges,
        DataAnalyst::AverageIncoming,
        DataAnalyst::AverageOutgoing,
        DataAnalyst::Volatility
      ]
    end

    def default_data_fetchers
      [
        DataFetcher::AccountDetails,
        DataFetcher::AccountBalance,
        DataFetcher::Charges,
        DataFetcher::Disputes,
        DataFetcher::Refunds,
        DataFetcher::Subscriptions,
        DataFetcher::Transfers,
        DataFetcher::BankAccounts,
        DataFetcher::Orders,
        DataFetcher::Returns,
        DataFetcher::PaymentMethods
      ]
    end
  end
end
