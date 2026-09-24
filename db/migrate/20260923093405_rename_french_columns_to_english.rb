class RenameFrenchColumnsToEnglish < ActiveRecord::Migration[8.1]
  def change
    # people
    rename_column :people, :titre, :title
    rename_column :people, :prenom, :first_name
    rename_column :people, :nom, :last_name
    rename_column :people, :formule, :greeting_formula
    rename_column :people, :adresse, :address
    rename_column :people, :cp, :postal_code
    rename_column :people, :lieu, :city
    rename_column :people, :telephone, :phone
    rename_column :people, :telephone_2, :phone_2
    rename_column :people, :date_naissance, :date_of_birth
    rename_column :people, :a_propos, :notes
    rename_column :people, :tutoiement, :use_tu

    # teachers
    rename_column :teachers, :date_debut, :start_date
    rename_column :teachers, :date_fin, :end_date
    rename_column :teachers, :statut, :status

    # students
    rename_column :students, :statut, :status
    rename_column :students, :niveau, :level
    rename_column :students, :date_inscription, :enrollment_date
    rename_column :students, :date_fin, :end_date
    rename_column :students, :date_premier_contact, :first_contact_date

    # interactions
    rename_column :interactions, :date_interaction, :interaction_date
    rename_column :interactions, :suivi_necessaire, :follow_up_needed
    rename_column :interactions, :suivi_delai, :follow_up_due_date
  end
end
