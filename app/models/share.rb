class Share < ApplicationRecord
  belongs_to :note
  belongs_to :user
  validates_uniqueness_of :note_id, scope: :user_id
end
