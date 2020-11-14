class AddDetailsToOwnedGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :owned_games, :user, null: true, foreign_key: true
    add_reference :owned_games, :board_game, null: true, foreign_key: true
    add_column :owned_games, :priority, :int
    add_column :owned_games, :trade_status, :int
    add_column :owned_games, :price, :decimal
    add_column :owned_games, :condition, :int
  end
end
