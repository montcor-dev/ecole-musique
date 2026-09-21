class AddProspectFieldsToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :source, :string
    add_column :students, :date_premier_contact, :date
  end
end
