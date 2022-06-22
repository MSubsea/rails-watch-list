class Vote < ApplicationRecord
  belongs_to :list
  validates :content, presence: true
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5, only_integer: true }
end
