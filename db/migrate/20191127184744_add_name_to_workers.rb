class AddNameToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :username, :string
    add_column :workers, :location, :string
    add_column :workers, :skills, :string
    add_column :workers, :hourly_rate, :integer
    add_column :workers, :status, :string
    add_column :workers, :description, :string
  end
end
