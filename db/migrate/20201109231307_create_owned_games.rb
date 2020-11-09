class CreateOwnedGames < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_games do |t|

      t.timestamps
    end
  end
end
