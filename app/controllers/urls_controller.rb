class UrlsController < ApplicationController

  def index
    urls = Url.all
    render json: urls
  end

  #url = "https://www.rottentomatoes.com/m/hulk/"
  #url = "https://www.rottentomatoes.com/m/it_comes_at_night/"

  def parseHTML(url)
    require 'open-uri'
    doc = Nokogiri::HTML( open(url) )

    title = doc.title
    puts "doc title is: " + title

    tomato_meter = doc.css("span.superPageFontColor")[0]
    puts "tomato_meter is: " + tomato_meter

    audience_score = doc.css("span.superPageFontColor")[12]
    puts "audience_score is: " + audience_score
  end

end
