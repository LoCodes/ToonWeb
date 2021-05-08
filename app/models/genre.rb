class Genre < ApplicationRecord
    has_many :animes
    has_many :users, through: :animes

    # accepts_nested_attributes_for :animes, :users
    validates :name, uniqueness: true, presence: true

    #scope method can be written 2 ways 
    #class method 

    def self.genres_animes 
        joins(:animes).group('genres.name')
    end 


    #scope method
    # scope :alpha, -> {joins(:animes).where('animes.name').group('genres.name')} 
    #{order('title')}
    # scope :alpha, -> {order('animes.title')}
    

    # scope :genres_animes, -> joins(:animes).group('genres.name')
end
