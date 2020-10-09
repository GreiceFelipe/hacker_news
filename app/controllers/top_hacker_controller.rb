class TopHackerController < ApplicationController
    include TopHackerRequest
    
    def index
        @top_hackers = top_hackers
    end
end
