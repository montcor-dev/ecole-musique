class AddTutoiementToPeople < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :tutoiement, :boolean
  end
end
