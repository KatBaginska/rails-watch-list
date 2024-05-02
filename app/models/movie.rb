class Movie < ApplicationRecord
  validates :title, :overview, presence: true, uniqueness: true
  validates :overview, length: { minimum: 1 }

  has_many :bookmarks
  has_many :lists, through: :bookmarks
end
