class DirectMessage < ApplicationRecord
  # after_create_commit { DirectMessageBroadcastJob.perform_later self }
  belongs_to :student, optional: true
  belongs_to :mentor, optional: true
  belongs_to :room
end
