require 'test_helper'

class LenderTest < ActiveSupport::TestCase

  test 'can destroy lenders' do
    subject = people(:sarah)
    assert subject.is_a? Lender
    subject.destroy!
  end
end
