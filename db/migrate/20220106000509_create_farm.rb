class CreateFarm < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :address
      t.integer :number_of_animals
      t.boolean :special_needs?
      t.string :special_needs_details
      t.references :user, foreign_key: true
    end
  end
end
