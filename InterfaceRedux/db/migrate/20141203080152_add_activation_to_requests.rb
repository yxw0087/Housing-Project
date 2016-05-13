class AddActivationToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :activation_digest, :string
    add_column :requests, :activated, :boolean, default: false
    add_column :requests, :activated_at, :datetime
  end
end
