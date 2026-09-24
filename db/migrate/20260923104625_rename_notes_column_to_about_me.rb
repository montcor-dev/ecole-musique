class RenameNotesColumnToAboutMe < ActiveRecord::Migration[8.1]
  def change
    # people
    rename_column :people, :notes, :about_me
  end
end
