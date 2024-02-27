class Book < ApplicationRecord
    belongs_to :author
    validates :title, :year, presence: true
end