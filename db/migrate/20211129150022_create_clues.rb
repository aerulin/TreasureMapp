class CreateClues < ActiveRecord::Migration[6.0]
  def change
    create_table :clues do |t|
      t.string :description
      t.integer :level
      t.references :mission
      t.timestamps
    end
  end
end
