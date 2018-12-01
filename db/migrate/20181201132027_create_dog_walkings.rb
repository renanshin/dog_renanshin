class CreateDogWalkings < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_walkings do |t|
      t.integer :status
      t.datetime :scheduled_date
      t.decimal :price, precision: 5, scale: 2
      t.integer :duration_minutes
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.integer :pets_number
      t.datetime :start_datetime
      t.datetime :finish_datetime

      t.timestamps
    end
  end
end
