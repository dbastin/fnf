class Pledge < ActiveRecord::Base
  belongs_to :loan
  belongs_to :lender

  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0}

  HUMANIZED_ATTRIBUTES = {
    amount: 'The pledge amount'
  }

  def self.human_attribute_name(attr, _={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
