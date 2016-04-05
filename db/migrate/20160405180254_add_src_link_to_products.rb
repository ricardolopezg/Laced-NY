class AddSrcLinkToProducts < ActiveRecord::Migration
  def change
    add_column :products, :src_link, :string
  end
end
