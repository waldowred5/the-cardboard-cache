class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_one :address
  has_many :owned_games
  has_many :wished_games

  has_many :send_requests, class_name: 'Trade', foreign_key: :requestor_id
  has_many :receive_requests, class_name: 'Trade', foreign_key: :requestee_id
end
