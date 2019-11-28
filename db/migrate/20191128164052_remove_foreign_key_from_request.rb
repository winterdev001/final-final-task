class RemoveForeignKeyFromRequest < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :requests, :companies
    remove_foreign_key :requests, :workers
    remove_foreign_key :feedbacks, :requests
  end
end
