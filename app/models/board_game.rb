class BoardGame < ApplicationRecord
    has_many :owned_games
    has_many :wished_games

    has_many :requestor_trades, class_name: 'Trade', foreign_key: :requestor_board_game_id
    has_many :requestee_trades, class_name: 'Trade', foreign_key: :requestee_board_game_id

    scope :ordered_by_rank, -> { order(overall_rank: :asc) }
end
