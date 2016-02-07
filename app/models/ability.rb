class Ability
  include CanCan::Ability

  def initialize(person)
    person ||= Person.new
    their_loans(person)
    their_pledges(person)
  end

  private

  def their_loans(person)
    can(:manage, ::Loan) do |l|
      l.borrower.nil? || l.borrower == person
    end
  end

  def their_pledges(person)
    can(:manage, ::Pledge) do |p|
      p.lender.nil? || p.lender == person
    end
  end
end
