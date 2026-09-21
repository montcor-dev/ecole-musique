class ChangeInteractionsToPolymorphic < ActiveRecord::Migration[8.1]
  def change
    # Remove old foreign key and column
    remove_foreign_key :interactions, :students
    remove_column :interactions, :student_id, :bigint

    # Add polymorphic columns
    add_column :interactions, :person_id, :bigint, null: false
    add_column :interactions, :person_type, :string, null: false

    # Add index for performance
    add_index :interactions, [ :person_id, :person_type ]
  end
end
