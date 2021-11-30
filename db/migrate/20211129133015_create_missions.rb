class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :secret_place
      t.string :name
      t.string :category
      t.float :lat
      t.float :long
      t.string :photo_url

      t.timestamps
    end
  end
end
