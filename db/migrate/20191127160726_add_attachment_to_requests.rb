class AddAttachmentToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :attachment, :string
  end
end
