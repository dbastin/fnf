class RenameInvitationUrlToInvitationCode < ActiveRecord::Migration
  def change
    rename_column :loans, :invitation_url, :invitation_code
  end
end
