class CreateBoardGames < ActiveRecord::Migration[6.0]
  def change
    create_table :board_games do |t|

      t.timestamps
    end
  end
end
