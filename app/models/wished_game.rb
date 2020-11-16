class WishedGame < ApplicationRecord
    belongs_to :user
    belongs_to :board_game

    # scope :name, -> { keyword(attribute: :value) }
    # scope :not_current_user, -> {where.not(user_id: :current_user.id)}
    # scope :other_user_wished_games, -> {not_current_user.where(wished_game: wished_game.id)}
end
