class OwnedGame < ApplicationRecord
    belongs_to :trader, class_name: "User"
    belongs_to :board_game
    has_many :images
end
