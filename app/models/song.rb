class Song < ApplicationRecord
  belongs_to :artist, dependent: :destroy
  validates :name, presence: :true
  validates :duration, #numericality: true


end
