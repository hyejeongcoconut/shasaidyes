class AddNameCategoryPhonenumberDescriptionToVendors < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :name , :string
    add_column :vendors, :category, :string
    add_column :vendors, :phone_number, :integer
    add_column :vendors, :description, :text
  end
end
