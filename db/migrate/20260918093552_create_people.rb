class CreatePeople < ActiveRecord::Migration[8.1]
  def change
    create_table :people do |t|
      t.string :titre
      t.string :prenom
      t.string :nom
      t.string :formule
      t.string :adresse
      t.string :cp
      t.string :lieu
      t.string :telephone
      t.string :telephone_2
      t.string :email
      t.date :date_naissance
      t.text :a_propos

      t.timestamps
    end
  end
end
