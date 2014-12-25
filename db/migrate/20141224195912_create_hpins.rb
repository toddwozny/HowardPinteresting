class CreateHpins < ActiveRecord::Migration
  def change
    create_table :hpins do |t|
      t.string :description

      t.timestamps
    end
  end
end
