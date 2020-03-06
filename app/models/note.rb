class Note < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :shares, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 3 }

  scope :activated, -> { where(status: true) }
  scope :pinned, -> { where(is_pinned: true) }
  scope :pinned_descending, -> { order(is_pinned: :desc) }
  scope :search_by_title_or_description, ->(keyword) { where('title like :searchKey or description like :searchKey', { searchKey: "#{keyword}%" }) }
end
