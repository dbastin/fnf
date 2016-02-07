require 'test_helper'

class PledgeTest < ActiveSupport::TestCase

  test 'can update' do
    loan = pledges(:one)
    loan.update_attributes!(amount: 50)
  end
end
