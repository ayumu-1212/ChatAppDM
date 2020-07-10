class Entry < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :mentor, optional: true
  belongs_to :room
end
