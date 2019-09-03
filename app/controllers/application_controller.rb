class ApplicationController < ActionController::Base
    def hello
        result = `python3 crawlerSample.py returnHeadlines()`
        render html: 'hello, world!' + result
    end
end
