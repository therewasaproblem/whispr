class News < ApplicationRecord
    validates_uniqueness_of :url, scope: [:title, :summary]
    belongs_to :sources
    belongs_to :categories
    has_and_belongs_to_many :users
end
