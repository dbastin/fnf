class Lender < Person
  has_many :invitations, dependent: :destroy, inverse_of: :lender
  accepts_nested_attributes_for :invitations
  has_many :pledges
end