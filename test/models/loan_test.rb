require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  test 'can update' do
    loan = loans(:one)
    loan.update_attributes!(principal: 100)
  end

  test 'can create' do
    actual = Loan.create!(borrower: people(:fred),
      principal: '1000',
      interest_apr: '9.99',
      term_in_months: 12,
      reason: 'Food')
    assert actual.invitation_code
  end

  test 'pledged' do
    loan = loans(:one)
    assert_equal 200, loan.pledged
  end

  test 'funded? and pending?' do
    loan = loans(:one)
    lender = people(:jessica)
    refute loan.funded?
    Pledge.create!(
      loan: loan,
      lender: lender,
      amount: '1000')
    assert loan.reload.funded?
    refute loan.reload.pending?
  end

  test 'expired? and pending?' do
    loan = loans(:one)
    refute loan.expired?
    assert loan.reload.pending?
    loan.update_attributes(created_at: 15.days.ago)
    assert loan.reload.expired?
    refute loan.reload.pending?
  end

  test 'remaining' do
    loan = loans(:one)
    assert_equal 800, loan.remaining
  end
end
