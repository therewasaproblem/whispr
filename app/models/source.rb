class Source < ApplicationRecord
    has_many :news
    belongs_to :category
end
