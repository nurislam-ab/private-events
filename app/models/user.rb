class User < ApplicationRecord
    has_many :events, foreign_key: :creator_id
    has_many :attendances, foreign_key: :attendee_id
    has_many :attended_events, through: :attendances

    def upcoming_events
        self.attended_events.where("DATE(date) >= DATE(?)", Time.now).order("date DESC")
    end
    
    def past_events
        self.attended_events.where("DATE(date) < DATE(?)", Time.now).order("date DESC")
    end
end
