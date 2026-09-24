class Student < ApplicationRecord
  belongs_to :person
  belongs_to :teacher, class_name: "Person", optional: true
  has_many :interactions, through: :person

  accepts_nested_attributes_for :person

  validates :status, inclusion: {
    in: %w[prospect actif en_pause ancien],
    message: "Doit être prospect, actif, en_pause ou ancien"
  }
end
