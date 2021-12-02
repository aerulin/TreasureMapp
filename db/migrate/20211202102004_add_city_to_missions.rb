class AddCityToMissions < ActiveRecord::Migration[6.0]
  def change
    add_column :missions, :city, :string
  end
end
