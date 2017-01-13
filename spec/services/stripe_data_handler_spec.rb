require_relative '../spec_helper'

class Services::StripeDataHandlerSpec < BaseSpec
  let(:service) { Services::StripeDataHandler }
  let(:user) { User.create(stripe_user_id: 23) }
  let(:injected_services) do
    {
      analysts: fake_analysts,
      fetchers: fake_fetchers
    }
  end

  before do
    service.new(user.id, injected_services).perform
  end

  after do
    fake_fetchers.each(&:reset)
    fake_analysts.each(&:reset)
  end

  it 'fetches all data for the given user' do
    assert_equal [true], fake_fetchers.map(&:called?).uniq
  end

  it 'sends a background job request to each processing service' do
    assert_equal [true], fake_analysts.map(&:called?).uniq
  end

  def fake_analysts
    [
      FakeMonthlyNumberOfCharges,
      FakeAverageNumberOfCharges
    ]
  end

  def fake_fetchers
    [
      FakeAccountDetails,
      FakeAccountBalance
    ]
  end
end
