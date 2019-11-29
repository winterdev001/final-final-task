class AddAttachmentImageToWorkers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :workers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :workers, :image
  end
end
