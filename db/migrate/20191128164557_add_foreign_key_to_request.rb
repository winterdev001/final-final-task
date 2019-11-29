class AddForeignKeyToRequest < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :requests, :companies, on_delete: :cascade
    add_foreign_key :requests, :workers, on_delete: :cascade
    add_foreign_key :feedbacks, :requests, on_delete: :cascade
  end
end
