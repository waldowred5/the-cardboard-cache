class AddDetailsToBoardGames < ActiveRecord::Migration[6.0]
  def change
    add_column :board_games, :name, :text
    add_column :board_games, :year_published, :int
    add_column :board_games, :short_description, :text
    add_column :board_games, :overall_rank, :int
    add_column :board_games, :geek_rating, :float
    add_column :board_games, :designer, :text
    add_column :board_games, :publisher, :text
    add_column :board_games, :min_players, :int
    add_column :board_games, :max_players, :int
    add_column :board_games, :min_playing_time, :int
    add_column :board_games, :max_playing_time, :int
    add_column :board_games, :age, :int
    add_column :board_games, :weight, :float
    add_column :board_games, :long_description, :text
    add_column :board_games, :publisher_website, :text
  end
end
