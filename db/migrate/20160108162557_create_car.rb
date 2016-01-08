class CreateCar < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.belongs_to :manufacturer, null: false
      t.string :color, null: false
      t.integer :year, null: false
      t.integer :mileage, null: false
    end
  end
end
