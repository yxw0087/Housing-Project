class AddIndexToRequestClid < ActiveRecord::Migration
  def change
    add_index :requests, :clid, unique: true
  end
end
