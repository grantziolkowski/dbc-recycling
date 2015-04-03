class CreateRecyclingBins < ActiveRecord::Migration
  def change
    create_table :recycling_bins do |t|
      t.string :borough
      t.string :address
      t.float :latitude, precision: 5
      t.float :longitude, precision: 5
    end
  end
end
