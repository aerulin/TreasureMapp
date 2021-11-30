class CreateChallengeQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :challenge_questions do |t|
      t.references :challenge
      t.references :question
      t.boolean :status, default: false
      t.integer :answer_counter, default: 0
      t.timestamps
    end
  end
end
