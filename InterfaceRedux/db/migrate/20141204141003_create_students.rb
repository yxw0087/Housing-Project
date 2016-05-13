class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :clid
      t.string :lastname
      t.string :firstname
      t.string :roomtype
      t.string :building
      t.string :roomid

      t.timestamps null: false
    end
  end
end
