class CreateSupercars < ActiveRecord::Migration
  def change
  	drop_table :supercars
    create_table :supercars do |t|
    	t.string :manufacturer
    	t.string :model
    	t.string :color
    	t.string :city
    	t.string :country
    	t.string :spot_date
    	t.string :spot_type
    	t.string :car_class
    	t.string :photo_url

      t.timestamps
    end
  end
end
