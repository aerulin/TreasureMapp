class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :status
      t.integer :score
      t.string :secret_counter
      t.string :open_question
      t.references :user
      t.references :mission

      t.timestamps
    end
  end
end
