json.extract! matter, :id, :name_or_type, :location, :acquired_date, :value, :loaned_to, :loaned_date, :description, :notes, :upc_barcode, :title, :released_date, :format, :artist_or_band, :track_list, :amateur, :lineage, :created_at, :updated_at
json.url matter_url(matter, format: :json)
