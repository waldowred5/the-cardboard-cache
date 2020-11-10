class AddDetailsToImages < ActiveRecord::Migration[6.0]
  def change
    add_reference :images, :owned_game, null: true, foreign_key: true
    add_column :images, :image_url, :text
  end
end
