class OwnedGame < ApplicationRecord
    belongs_to :user
    belongs_to :board_game
    has_many :images
end
