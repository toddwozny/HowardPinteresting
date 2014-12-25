class AddAttachmentImageToHpins < ActiveRecord::Migration
  def self.up
    change_table :hpins do |t|

      t.attachment :image

    end
  end

  def self.down

    remove_attachment :hpins, :image

  end
end
