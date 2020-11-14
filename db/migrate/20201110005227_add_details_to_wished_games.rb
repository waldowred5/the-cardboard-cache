class AddDetailsToWishedGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :wished_games, :user, null: true, foreign_key: true
    add_reference :wished_games, :board_game, null: true, foreign_key: true
    add_column :wished_games, :priority, :int
  end
end
