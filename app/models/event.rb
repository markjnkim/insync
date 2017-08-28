class Event < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :invitees

  validates :title, :location, presence: true

  def date_start
    start_time.strftime("%b %e, %Y")
  end

  def time_start
    "#{start_time.strftime("%l:%M")} pm"
  end
end
