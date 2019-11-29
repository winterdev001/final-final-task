class AddNameToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :name, :string
    add_column :companies, :location, :string
    add_column :companies, :description, :string
    
  end
end
