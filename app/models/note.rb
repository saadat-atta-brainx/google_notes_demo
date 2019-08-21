class Note < ApplicationRecord
    has_many :assets, dependent: :destroy
    belongs_to :user
end
