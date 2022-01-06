class CreateMission < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.references :user, foreign_key: true
      t.references :farm, foreign_key: true
    end
  end
end
