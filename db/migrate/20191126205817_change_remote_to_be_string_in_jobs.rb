class ChangeRemoteToBeStringInJobs < ActiveRecord::Migration[5.2]
  def change
    change_column :jobs, :remote, :string
  end
end
