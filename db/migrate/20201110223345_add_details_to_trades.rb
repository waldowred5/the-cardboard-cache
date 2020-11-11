class AddDetailsToTrades < ActiveRecord::Migration[6.0]
  def change
    add_reference :trades, :requestor, null: false, foreign_key: { to_table: 'users' }
    add_reference :trades, :requestee, null: false, foreign_key: { to_table: 'users' }
    add_reference :trades, :requestor_board_game, null: false, foreign_key: { to_table: 'board_games' }
    add_reference :trades, :requestee_board_game, null: false, foreign_key: { to_table: 'board_games' }
    add_column :trades, :requestor_accepted_at, :datetime
    add_column :trades, :requestee_accepted_at, :datetime
    add_column :trades, :traded_at, :datetime
    add_column :trades, :cancelled_at, :datetime
  end
end
