class AddWorkerToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :worker, index: true
  end
end
