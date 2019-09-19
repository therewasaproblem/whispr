class ApplicationController < ActionController::Base
    def hello
        render html: 'teste aqui'
    end
end
