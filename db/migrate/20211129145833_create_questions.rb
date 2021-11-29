class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :answer
      t.float :lat
      t.float :lng
      t.references :mission
      t.timestamps
    end
  end
end
