class MentorsController < ApplicationController
  
  def index
    @mentors = Mentor.all
  end

  def show
    @mentor = Mentor.find(params[:id])
    @mentorEntry = Entry.where(mentor_id: @mentor.id)
    if mentor_signed_in?
      @currentMentorEntry = Entry.where(mentor_id: current_mentor.id)
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
    elsif student_signed_in?
      @currentStudentEntry = Entry.where(student_id: current_student.id)
      @currentStudentEntry.each do |cu|
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
