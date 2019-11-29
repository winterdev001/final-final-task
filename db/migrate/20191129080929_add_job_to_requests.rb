class AddJobToRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :requests, :job, on_delete: :cascade, foreign_key: true
  end
end
