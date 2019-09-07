class ApplicationController < ActionController::Base
    def hello
        result = `python3 PythonScripts/crawlerSample.py Bolsonaro`
        render html: 'hello, world!' + result
    end
end
