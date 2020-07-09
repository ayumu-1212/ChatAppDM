module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_mentor

    def connect
      self.current_mentor = find_verified_mentor
    end

    protected
    def find_verified_mentor
      verified_mentor = Mentor.find_by(id: env['warden'].mentor.id)
      return reject_unauthorized_connection unless verified_mentor
      verified_mentor
    end
  end
end