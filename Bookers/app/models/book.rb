class Book < ApplicationRecord
  validates :title, presence: true
  valedates :body, presence: true
end
