class InvitationCode
  include Virtus.model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :code, String
  validates :code, presence: true

  def persisted?
    false
  end
end
