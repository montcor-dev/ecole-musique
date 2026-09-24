class Interaction < ApplicationRecord
  belongs_to :person

  enum :interaction_type, { email: 0, phone: 1, sms: 2, video_call: 3, in_person: 4, mail: 5, other: 6 }

  validates :interaction_date, presence: true
end
