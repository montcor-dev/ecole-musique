class Person < ApplicationRecord
  has_one :student
  has_one :teacher
  has_many :taught_students, class_name: "Student", foreign_key: :teacher_id
  has_many :interactions, as: :person
  has_many :todos, dependent: :destroy
end
