class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :name_or_type
      t.string :location
      t.date :acquired_date
      t.integer :value
      t.string :loaned_to
      t.date :loaned_date
      t.text :description
      t.text :notes
      t.integer :upc_barcode
      t.string :title
      t.date :released_date
      t.string :format
      t.string :artist_or_band
      t.text :track_list
      t.boolean :amateur
      t.text :lineage

      t.timestamps null: false
    end
  end
end
