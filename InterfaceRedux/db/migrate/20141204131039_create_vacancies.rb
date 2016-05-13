class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :room
      t.string :occupant

      t.timestamps null: false
    end
  end
end
