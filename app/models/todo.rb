class Todo < ApplicationRecord
  belongs_to :person, optional: true
  
  before_update :set_completed_at, if: :completed?
  
  private
  
  # Automatically sets completed_at timestamp when todo is marked as complete.
  # Only runs when completed changes from false/nil to true.
  # Prevents overwriting on subsequent updates (e.g., editing title).
  #
  # Example:
  #   todo.completed = true
  #   todo.save  # completed_at is set to current time
  #
  #   todo.title = "Updated"
  #   todo.save  # completed_at is NOT changed
  def set_completed_at
    self.completed_at = Time.current if completed_changed? && completed?
  end
  
  
  # Converts the comma-separated keywords string into a clean array.
  # Handles nil values, strips whitespace, returns empty array if no keywords.
  #
  # Example:
  #   todo.keywords = "urgent, invoicing, piano"
  #   todo.keyword_list  # => ["urgent", "invoicing", "piano"]
  def keyword_list
    keywords&.split(',')&.map(&:strip)&.compact || []
  end

  # Sets keywords from array or string. Arrays are joined with comma+space.
  #
  # Example:
  #   todo.keyword_list = ["urgent", "invoicing"]
  #   todo.keywords  # => "urgent, invoicing"
  def keyword_list=(list)
    self.keywords = list.is_a?(Array) ? list.join(', ') : list
  end
  
end
