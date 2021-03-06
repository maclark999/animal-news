class NewsFetcher
  def initialize
    @reddit_con = Faraday.new(:url => 'https://www.reddit.com') do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end

  def news
    response = @reddit_con.get do |req|
      req.url "/r/inthenews.json"
      req.headers['Content-Type'] = 'application/json'
    end

   JSON.parse(response.body)
 end

 def titles
   @news = NewsFetcher.new
   @headline = @news.news["data"]["children"].map do |child|
     {title: child["data"]["title"], url: child["data"]["url"]}
   end
 end

 def url
   @news = NewsFetcher.new
   @headline = @news.news["data"]["children"].map do |child|
     child["data"]["url"]
   end
 end
end
