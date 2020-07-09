class MentorsController < ApplicationController
  before_action :authenticate_mentor!
  
  def index
    @mentors = Mentor.all
  end

  def show
    @mentor = Mentor.find(params[:id])
    @currentMentorEntry = Entry.where(mentor_id: current_mentor.id)
    @mentorEntry=Entry.where(mentor_id: @mentor.id)
    unless @mentor.id == current_mentor.id
      @currentMentorEntry.each do |cu|
        @mentorEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
