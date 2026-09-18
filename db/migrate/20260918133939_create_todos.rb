class CreateTodos < ActiveRecord::Migration[8.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.references :person, null: false, foreign_key: true
      t.date :due_date
      t.boolean :completed
      t.datetime :completed_at
      t.string :keywords

      t.timestamps
    end
  end
end
