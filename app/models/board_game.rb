class BoardGame < ApplicationRecord
    has_many :wished_games
    has_many :owned_games
end
