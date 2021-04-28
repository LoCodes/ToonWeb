class User < ApplicationRecord
    has_many :animes
    has_many :genres, through: :animes
end
