class Loan < ActiveRecord::Base
  belongs_to :borrower
  has_many :pledges

  before_create :generate_invitation_code

  validates :borrower, presence: true
  validates :reason, presence: true, length: {maximum: 255}
  validates :principal, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :term_in_months, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :interest_apr, presence: true, numericality: {greater_than_or_equal_to: 0}

  HUMANIZED_ATTRIBUTES = {
    term_in_months: 'How long you need to repay',
    principal: 'How much you need',
    interest_apr: 'The interest amount'
  }

  def self.human_attribute_name(attr, _={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def pledged
    pledges.map(&:amount).reduce(:+) || 0
  end

  def pending?
    !funded? and !expired?
  end

  def funded?
    pledged >= principal
  end

  def expired?
    ((Time.zone.now - created_at) / 1.day).to_i > 14
  end

  def remaining
    [0, principal - pledged].max
  end

  private

  def generate_invitation_code
    self.invitation_code = SecureRandom.urlsafe_base64
  end
end
