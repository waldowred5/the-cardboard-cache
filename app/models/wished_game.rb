class WishedGame < ApplicationRecord
    belongs_to :wishlister, class_name: "User"
    belongs_to :board_game
end
