class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.datetime :deadline
      t.integer :amount
      t.string :status
      t.string :type
      t.string :location
      t.boolean :remote
      t.string :description
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
