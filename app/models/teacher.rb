class Teacher < ApplicationRecord
  belongs_to :person
  has_many :interactions, through: :person
end
