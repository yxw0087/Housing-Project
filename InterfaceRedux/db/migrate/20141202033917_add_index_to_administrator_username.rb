class AddIndexToAdministratorUsername < ActiveRecord::Migration
  def change
    add_index :administrators, :username, unique: true
  end
end
