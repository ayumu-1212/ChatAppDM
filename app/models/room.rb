class Room < ApplicationRecord
    has_many :entries
    has_many :direct_messages
    has_many :mentors, through: :entries
    has_many :students, through: :entries
end
