class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.boolean :status, default: false
      t.integer :score, default: 0
      t.integer :secret_counter, default: 0
      t.references :user
      t.references :mission

      t.timestamps
    end
  end
end
