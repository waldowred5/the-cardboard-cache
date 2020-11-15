class OwnedGame < ApplicationRecord
    belongs_to :user
    belongs_to :board_game
    has_many :images

    # enum trade_status: {tradeable: 0, not_for_trade: 1}
    # enum condition: {new: 0, like_new: 1, used: 2}
end
