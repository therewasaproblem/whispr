class News < ApplicationRecord
    validates_uniqueness_of :url, scope: [:title, :summary]
    belongs_to :sources, required: false
    belongs_to :categories, required: false
    has_and_belongs_to_many :users
end
