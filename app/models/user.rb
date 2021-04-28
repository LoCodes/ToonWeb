class User < ApplicationRecord
    has_secure_password

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    # validates :email, presence: true 
    # validates :email, uniqueness: true

    has_many :animes
    has_many :genres, through: :animes

end
