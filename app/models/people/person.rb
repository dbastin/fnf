class Person < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true
  validates :password, length: {minimum: 3}, confirmation: true, if: :validate_password?
  validates_confirmation_of :password

  private

  def validate_password?
    password.present?
  end
end
