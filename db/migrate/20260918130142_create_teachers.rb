class CreateTeachers < ActiveRecord::Migration[8.1]
  def change
    create_table :teachers do |t|
      t.references :person, null: false, foreign_key: true
      t.text :styles
      t.date :date_debut
      t.date :date_fin
      t.string :statut
      t.string :instrument

      t.timestamps
    end
  end
end
