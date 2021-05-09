module AnimesHelper 

    # can define method send to link else error msg 
    def edit_link
        if current_user == @anime.user 
            link_to "Edit", edit_anime_path(@anime)
        end 

    end
    def delete_link 
        if current_user == @anime.user 
            link_to "Delete", anime_path(@anime), method: :delete, data: { confirm: 'Are you sure you want to delete this?' }
        end 
    end 

    def genre_name
        if @genre
            @genre.name
        end
    end 
    
end


