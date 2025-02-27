class Movie < ApplicationRecord
  has_many :bookmarks # dependent: :restrict_with_error can’t delete a movie if its referenced in at least one bookmark
  has_many :lists, through: :bookmarks # A movie can be in multiple lists via bookmarks.

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
