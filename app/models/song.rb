class Song < ApplicationRecord
  belongs_to :artist, dependent: :destroy
  # validates :name 
  # validates :duration, numericality: true
end
