class News < ApplicationRecord
    validates_uniqueness_of :url, scope: [:title, :summary]
end
