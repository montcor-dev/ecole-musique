class DropProspectsTable < ActiveRecord::Migration[8.1]
  def change
    drop_table :prospects
  end
end
