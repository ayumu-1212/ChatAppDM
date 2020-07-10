class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    #present?の戻り値は真偽値。よって、trueの場合、
    if mentor_signed_in? && Entry.where(:mentor_id => current_mentor.id, :room_id => @room.id).present?
      @direct_messages = @room.direct_messages
      @entries = @room.entries
    elsif student_signed_in? && Entry.where(:student_id => current_student.id, :room_id => @room.id).present?
      @direct_messages = @room.direct_messages
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @room = Room.create(:name => "DM")
    @entry1 = Entry.create(:room_id => @room.id, :mentor_id => current_mentor.id)
    @entry2 = Entry.create(params.require(:entry).permit(:mentor_id, :room_id).merge(:room_id => @room.id))
    redirect_to room_path(@room.id)
  end
end
