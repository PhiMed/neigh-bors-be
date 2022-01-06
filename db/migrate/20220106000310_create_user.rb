class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :is_available_for_missions?
      t.integer :rescuer_trailer_capacity
    end
  end
end
