class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.integer :client_id
      t.string :animal_name
      t.string :pet_type
      t.string :breed
      t.string :color
      t.boolean :fixed
      t.datetime :birthdate
      t.boolean :active
      t.string :sex
      t.text :notes

      t.timestamps
    end
  end
end
