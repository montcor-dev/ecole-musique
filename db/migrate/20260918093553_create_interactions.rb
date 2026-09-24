class CreateInteractions < ActiveRecord::Migration[8.1]
  def change
    create_table :interactions do |t|
      t.references :person, null: false, foreign_key: true
      t.date       :date_interaction
      t.text       :note
      t.boolean    :suivi_necessaire, default: false
      t.date       :suivi_delai
      t.integer    :interaction_type
      t.timestamps
    end
  end
end
