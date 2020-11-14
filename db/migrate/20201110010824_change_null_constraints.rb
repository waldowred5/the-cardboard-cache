class ChangeNullConstraints < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:wished_games, :user_id, false)
    change_column_null(:wished_games, :board_game_id, false)
    change_column_null(:owned_games, :user_id, false)
    change_column_null(:owned_games, :board_game_id, false)
    change_column_null(:images, :owned_game_id, false)
  end
end
