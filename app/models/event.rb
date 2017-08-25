class Event < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user

  validates :title, presence: true
end
