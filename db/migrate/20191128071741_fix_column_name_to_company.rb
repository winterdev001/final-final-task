class FixColumnNameToCompany < ActiveRecord::Migration[5.2]
  def change
    rename_column :companies, :name, :username
  end
end
