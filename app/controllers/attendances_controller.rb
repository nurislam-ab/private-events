class AttendancesController < ApplicationController
    def new
        @attendance = Attendance.new
    end
    
    def create
        @user = User.find(params[:user_id])
        @event = Event.find(params[:event_id])

        @event.attendees << current_user

        redirect_to @event
    end
end
