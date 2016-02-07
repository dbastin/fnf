class AddInvitationUrlToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :invitation_url, :string
  end
end
