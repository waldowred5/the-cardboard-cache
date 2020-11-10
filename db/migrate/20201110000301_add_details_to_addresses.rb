class AddDetailsToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :user, null: true, foreign_key: true
    add_column :addresses, :street_1, :text
    add_column :addresses, :street_2, :text
    add_column :addresses, :post_code, :text
    add_column :addresses, :city, :text
    add_column :addresses, :state, :text
    add_column :addresses, :country, :text
  end
end
