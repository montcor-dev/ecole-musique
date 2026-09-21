class Interaction < ApplicationRecord
  belongs_to :person, polymorphic: true
end
