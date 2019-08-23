class Note < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 3 }

  scope :activated, -> { where(status: true) }
  scope :pinned, -> { where(is_pinned: true) }
  scope :pinned_descending, -> { order(is_pinned: :desc) }
  scope :search_for, ->(keyword) { where('title like :search or description like :search', { search: "#{keyword}%" }) }
end
