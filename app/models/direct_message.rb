class DirectMessage < ApplicationRecord
  belongs_to :mentor
  belongs_to :room
end
