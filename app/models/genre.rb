class Genre < ApplicationRecord
    has_many :animes
    has_many :users, through: :animes
end
