class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :titre
      t.string :prenom
      t.string :nom
      t.string :adresse
      t.string :cp
      t.string :lieu
      t.string :telephone
      t.string :telephone2
      t.string :email
      t.string :statut
      t.string :niveau
      t.string :style
      t.date :date_naissance
      t.date :date_inscription
      t.date :date_fin

      t.timestamps
    end
  end
end
