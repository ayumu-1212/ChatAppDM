class DirectMessagesController < ApplicationController
  def create
    @direct_message = DirectMessage.new(direct_message_params)
    if mentor_signed_in?
      @direct_message.mentor_id = current_mentor.id
    elsif student_signed_in?
      @direct_message.student_id = current_student.id
    end 
    if @direct_message.save
      DirectMessageBroadcastJob.perform_later @direct_message
    end
  end
  
  private
    def direct_message_params
      params.permit(:content, :mentor_id, :student_id, :room_id)
    end
end
