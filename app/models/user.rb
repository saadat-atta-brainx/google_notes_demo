class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes, dependent: :destroy
  has_many :shares, dependent: :destroy
  has_many :shared_notes, through: :shares, source: :note

  scope :search_key, ->(keyword) { where('email like :searchKey', searchKey: "#{keyword}%") }

end
