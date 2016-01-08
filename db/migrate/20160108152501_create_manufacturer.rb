class CreateManufacturer < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name, null: false
      t.string :country, null: false
    end
  end
end
