class Anime < ApplicationRecord
    belongs_to :user
    belongs_to :genre

    validates :title, uniqueness: true, presence: true
    validates :content, presence: true 
    accepts_nested_attributes_for :genre, reject_if: :all_blank

    # def genre_attributes=(attr_hash)
    #     # see if the object exists first 
    #     #create if it doesnt exist 
    #     if !attr_hash.empty?
    #         self.genre = Genre.find_or_create_by(attr_hash)
    #     end 
    #     # let item know about this store object 
        
    # end 


    # SCOPE METHODS 

    # class methods that query the table associated with database 
    # return 

    # 2 ways to define scope methods 

    scope :alpha, -> {order('title')}


end
