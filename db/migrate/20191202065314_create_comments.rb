class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :company, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
