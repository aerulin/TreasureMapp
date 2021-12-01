class AddDescriptionToMissions < ActiveRecord::Migration[6.0]
  def change
    add_column :missions, :description, :string
  end
end
