class ApplicationController < ActionController::Base
    def hello
        result = `python3 ScriptsDaAplicacao/crawlerSample.py Bolsonaro`
        render html: 'hello, world!' + result
    end
end
