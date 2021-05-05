class Anime < ApplicationRecord
    belongs_to :user
    belongs_to :genre

    # accepts_nested_attributes_for :genre

    def genre_attributes=(attr_hash)
        # see if the object exists first 
        #create if it doesnt exist 
        if !attr_hash.empty?
            self.genre = Genre.find_or_create_by(attr_hash)
        end 
        # let item know about this store object 
        
    end 

end
