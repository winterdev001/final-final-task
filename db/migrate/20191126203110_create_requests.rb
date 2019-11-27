class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :content
      t.string :feedback
      t.integer :status
      t.references :worker, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
