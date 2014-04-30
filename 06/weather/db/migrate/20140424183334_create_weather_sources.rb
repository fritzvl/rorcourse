class CreateWeatherSources < ActiveRecord::Migration
  def change
    create_table :weather_sources do |t|
      t.string :name
      t.string :feed_url
      t.timestamps
    end
  end
end
