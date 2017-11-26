class Matter < ActiveRecord::Base
    def self.search(search)
        where("name_or_type LIKE ? OR description LIKE ? OR title LIKE ? OR artist_or_band LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
    end
end
