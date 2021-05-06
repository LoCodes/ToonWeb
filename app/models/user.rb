class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true 
    
    # validates [:username, :email], presence: true

    has_many :animes
    has_many :genres, through: :animes

    # accepts_nested_attributes_for :animes, :genres

end
