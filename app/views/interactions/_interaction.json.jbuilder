json.extract! interaction, :id, :date_interaction, :student_id, :moyen, :note, :suivi_necessaire, :suivi_delai, :auteur, :interaction_type, :annexes, :created_at, :updated_at
json.url interaction_url(interaction, format: :json)
