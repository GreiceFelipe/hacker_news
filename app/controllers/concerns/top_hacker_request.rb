module TopHackerRequest
    extend ActiveSupport::Concern

    def top_hackers
        topstories_id = topstories(15)
        top_hackers =  []

        topstories_id.each do |id|
            hacker = search_item(id)

            date = Time.at(hacker['time']).strftime("%m/%d/%Y %H:%M")

            top_hacker = {
                title: hacker['title'], 
                author: hacker['by'], 
                date: date,
                url: hacker['url']
            }

            if hacker['kids'].present?
                comments = []
                hacker['kids'].each do |comment_id|
                    comment = search_item(comment_id)
                    next if comment['text'].blank?
                    next if comment['text'].split.size < 20
                    date = Time.at(comment['time']).strftime("%m/%d/%Y %H:%M") rescue nil
                    comments << {author: comment['by'], date: date, body: comment['text']}
                end
                top_hacker[:comments] = comments
            end

            top_hackers << top_hacker
        end
        top_hackers
    end

    private 

    def topstories(quantity)
        response = Request.execute('https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty')
        response.sort.last(quantity)
    end

    def search_item(id)
        Request.execute("https://hacker-news.firebaseio.com/v0/item/#{id}.json?print=pretty")
    end


end