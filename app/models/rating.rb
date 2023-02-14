class Rating < ApplicationRecord
  belongs_to :movie
  validates :rating, numericality: {only_integer: true, in: 1..10}
end
