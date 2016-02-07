class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :type
      t.string :name
      t.string :address
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
