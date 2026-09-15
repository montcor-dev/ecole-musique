class CreateInteractions < ActiveRecord::Migration[8.1]
  def change
    create_table :interactions do |t|
      t.datetime :date_interaction
      t.references :student, null: false, foreign_key: true
      t.string :moyen
      t.text :note
      t.boolean :suivi_necessaire
      t.date :suivi_delai
      t.string :auteur
      t.string :interaction_type
      t.string :annexes

      t.timestamps
    end
  end
end
