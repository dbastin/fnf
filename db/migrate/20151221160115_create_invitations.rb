class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :lender, index: true, foreign_key: true
      t.references :loan, index: true, foreign_key: true
    end
  end
end
