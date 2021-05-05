class Genre < ApplicationRecord
    has_many :animes
    has_many :users, through: :animes

    # accepts_nested_attributes_for :animes, :users
end
