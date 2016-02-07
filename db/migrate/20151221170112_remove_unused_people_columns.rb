class RemoveUnusedPeopleColumns < ActiveRecord::Migration
  def change
    remove_column :people, :address
    remove_column :people, :state
    remove_column :people, :zip
    remove_column :people, :phone
  end
end
