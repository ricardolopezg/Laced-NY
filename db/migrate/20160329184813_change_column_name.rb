class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :products, :type, :category_type
    rename_column :products, :name, :model
  end
end
