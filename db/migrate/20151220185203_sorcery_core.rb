class SorceryCore < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.column :crypted_password, :string
      t.column :salt, :string
    end

    add_index :people, :email, unique: true
  end
end