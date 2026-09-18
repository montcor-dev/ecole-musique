class RemoveContactFieldsFromStudents < ActiveRecord::Migration[8.1]
  def change
    remove_column :students, :titre, :string
    remove_column :students, :prenom, :string
    remove_column :students, :nom, :string
    remove_column :students, :adresse, :string
    remove_column :students, :cp, :string
    remove_column :students, :lieu, :string
    remove_column :students, :telephone, :string
    remove_column :students, :telephone2, :string
    remove_column :students, :email, :string
    remove_column :students, :date_naissance, :date
  end
end
