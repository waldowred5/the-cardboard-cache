class Trade < ApplicationRecord
    belongs_to :requestor, :class_name "User"
    belongs_to :requestee, :class_name "User"
    belongs_to :requestor_board_game, :class_name "Board_Game"
    belongs_to :requestee_board_game, :class_name "Board_Game"
end
