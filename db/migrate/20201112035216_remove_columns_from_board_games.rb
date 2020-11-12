class RemoveColumnsFromBoardGames < ActiveRecord::Migration[6.0]
  def change
    add_column :board_games, :image, :text
    remove_column :board_games, :designer, :text
    remove_column :board_games, :publisher, :text
    remove_column :board_games, :short_description, :text
    remove_column :board_games, :publisher_website, :text
  end
end
