class CreateBreweries < ActiveRecord::Migration
  def change
  	create_table :favorites do |t|
  		t.string :description
  		t.timestamps
  	end
  end
end
