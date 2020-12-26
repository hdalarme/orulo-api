class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.string :orulo_building_id

      t.timestamps
    end
  end
end
