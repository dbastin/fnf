Borrower.delete_all
Borrower.create!(name: 'Fred Stills',
  email: 'fred@example.com',
  password: '123123',
  password_confirmation: '123123')

Loan.delete_all
Loan.create!(
  borrower: Borrower.all.first,
  principal: '1000',
  interest_apr: '9.99',
  term_in_months: '12',
  reason: 'Food',
  invitation_code: SecureRandom.urlsafe_base64)

Lender.delete_all
Lender.create!(name: 'Jessica Jones',
  email: 'jessica@example.com',
  password: '123123',
  password_confirmation: '123123')

Invitation.delete_all
Invitation.create(
  loan: Loan.all.first,
  lender: Lender.all.first)

Pledge.delete_all
Pledge.create(
  loan: Loan.all.first,
  lender: Lender.all.first,
  amount: '100')