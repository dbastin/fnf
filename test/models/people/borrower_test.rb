require 'test_helper'

class BorrowerTest < ActiveSupport::TestCase

  test 'can update borrowers' do
    subject = people(:fred)
    assert subject.is_a? Borrower
    expected = 'freddie@example.com'
    subject.update_attributes!(email: expected, password: '123', password_confirmation: '123')
    assert_equal expected, subject.reload.email
  end
end
