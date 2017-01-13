require_relative '../spec_helper'

class StripeUserAccountSpec < BaseSpec
  #clean the database
  after { StripeUserAccount.delete_all }

  let(:stripe_user_id) { 'acct_23' }
  let(:charges) { 'some data in json format' }
  let(:attributes) do
    {
      stripe_user_id: stripe_user_id,
      charges: charges
    }
  end

  describe 'validations' do
    it 'tests validations' do
      skip
    end
  end

  describe 'create_or_update' do
    describe 'when the user_account does not exist' do
      it 'creates one' do
        StripeUserAccount.create_or_update(attributes)
        result = StripeUserAccount.last
        assert_equal stripe_user_id, result.stripe_user_id
        assert_equal charges, result.charges
      end
    end

    describe 'when the user_account does exist' do
      let(:updated_charges) { 'different json data' }
      before { StripeUserAccount.create(attributes) }

      it 'updates the given data' do
        StripeUserAccount.create_or_update(attributes.merge(charges: updated_charges))
        result = StripeUserAccount.last
        assert_equal stripe_user_id, result.stripe_user_id
        assert_equal updated_charges, result.charges
      end
    end
  end
end
