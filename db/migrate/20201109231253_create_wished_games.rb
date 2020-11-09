class CreateWishedGames < ActiveRecord::Migration[6.0]
  def change
    create_table :wished_games do |t|

      t.timestamps
    end
  end
end
