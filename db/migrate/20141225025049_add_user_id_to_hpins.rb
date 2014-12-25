class AddUserIdToHpins < ActiveRecord::Migration
  def change
    add_column :hpins, :user_id, :integer
    add_index :hpins, :user_id
  end
end
