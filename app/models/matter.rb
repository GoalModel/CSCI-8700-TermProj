class Matter < ActiveRecord::Base
    def self.search(search)
        where("name_or_type LIKE ? OR description LIKE ? OR notes LIKE ? OR title LIKE ? OR artist_or_band LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
    end
    
    def self.find_it_by(finders)
       
        @finders = finders
        puts "Puts"
        puts "#{@finders}"
        @checkit = where(@finders).to_sql
        puts "#{@checkit}"
       # where(@finders)
    end
end
