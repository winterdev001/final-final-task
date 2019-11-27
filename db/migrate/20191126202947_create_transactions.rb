class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :worker, foreign_key: true
      t.references :company, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
