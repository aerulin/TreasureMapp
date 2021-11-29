class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :status
      t.string :score
      t.string :secret_counter
      t.string :open_question
      t.user :references
      t.string :references
      t.string :mission

      t.timestamps
    end
  end
end
