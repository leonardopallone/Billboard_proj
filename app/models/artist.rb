class Artist < ApplicationRecord
  belongs_to :billboard

  
  has_many :songs, dependent: :destroy
  # validates :name
  # validates :rank, numericality: {less_than_or_equal_to:10}
end
