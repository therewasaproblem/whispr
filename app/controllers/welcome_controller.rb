class WelcomeController < ActionController::Base
    def hello
        render "welcome", layout: "application"
    end
end
