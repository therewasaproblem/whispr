class ApplicationController < ActionController::Base
    def hello
        render "index", layout: "application"
    end
end
