class CreateProspects < ActiveRecord::Migration[8.1]
  def change
    create_table :prospects do |t|
      t.references :person, null: false, foreign_key: true
      t.string :source
      t.string :statut
      t.date :date_premier_contact
      t.string :instrument

      t.timestamps
    end
  end
end
