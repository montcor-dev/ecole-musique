class Person < ApplicationRecord
  has_many :interactions, dependent: :restrict_with_error
  has_one :student
  has_one :teacher
  has_many :taught_students, class_name: "Student", foreign_key: :teacher_id
  has_many :todos, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def role_record
    student || teacher
  end
end
