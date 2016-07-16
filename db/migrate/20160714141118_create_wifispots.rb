class CreateWifispots < ActiveRecord::Migration
  def change
    create_table :wifispots do |t|
      t.integer :spot_id
      t.string :name_jp
      t.string :name_en
      t.string :status
      t.string :category
      t.string :usable_place
      t.string :postcode
      t.string :prefecture
      t.string :address_jp
      t.string :address_en
      t.string :tel
      t.string :open_time
      t.string :ssid
      t.string :usable_time
      t.string :procedure
      t.string :lang_support
      t.string :languages
      t.string :url
      t.float :y_coord
      t.float :x_coord
      t.string :place_code

      t.timestamps null: false
    end
  end
end
