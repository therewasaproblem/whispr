class ApplicationController < ActionController::Base
    def hello
        render html: 'Hello! Welcome to WHISPR, a place where you will find recent AND trustful contents about your favourite and most searched news. Happy News! Literally..'
    end
end
