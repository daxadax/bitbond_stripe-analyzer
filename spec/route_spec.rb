require_relative 'spec_helper'

class RouteSpec < BaseSpec
  include Rack::Test::Methods
  before { app.views = './views' }

  describe '/connect' do
    let(:result) { get 'connect', '{}' }

    it 'handles the request' do
      assert_equal 200, result.status
    end
  end

  describe '/stripe_callback' do
    let(:result) { get 'stripe_callback', { 'code': 'fake code' } }

    it 'handles the request' do
      assert_equal 200, result.status
    end

    describe 'when the connection succeeds' do
      it 'fetches a token and uses it to build a new User' do
        skip
      end

      it 'renders the successful connection page' do
        skip
      end

      describe 'when the user has already been connected' do
        it 'does not build a new User if one is already present' do
          skip
        end
      end
    end

    describe 'when the connection fails' do
      it 'does not build a new User' do
        skip
      end

      it 'renders the unsuccessful connection page' do
        skip
      end
    end
  end
end
