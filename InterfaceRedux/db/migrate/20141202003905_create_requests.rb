class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :clid
      t.string :gender
      t.string :building
      t.string :room

      t.timestamps null: false
    end
  end
end
