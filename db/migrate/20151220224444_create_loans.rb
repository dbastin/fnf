class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :borrower, index: true, foreign_key: true
      t.integer :principal
      t.decimal :interest_apr
      t.integer :term_in_months
      t.string :reason

      t.timestamps null: false
    end
  end
end
