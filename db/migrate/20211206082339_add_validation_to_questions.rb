class AddValidationToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :validation, :string, array: true, default: []
  end
end
