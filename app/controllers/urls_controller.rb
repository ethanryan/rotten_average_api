class UrlsController < ApplicationController

  def index
    urls = Url.all
    render json: urls
  end

  def create(url_string)
    #  make a new url with title and user_id from params
    #url = Url.new(story_params)
    url = Url.new #need to save before calling below???
    url.parseHTML(url_string) #calling parseHTML method in url model

    #url.create_content("genre", "story_characters") #calling createContent method in url model
    url.save
    
    url.fix_title
    url.fix_tomato_meter
    url.fix_audience_score
    url.save

    render json: url
  end #end of create story method


  #url = "https://www.rottentomatoes.com/m/hulk/"
  #url = "https://www.rottentomatoes.com/m/it_comes_at_night/"
  #url = "https://www.rottentomatoes.com/tv/black_mirror"

  # def parseHTML(url)
  #   require 'open-uri'
  #   doc = Nokogiri::HTML( open(url) )
  #
  #   title = doc.title
  #   puts "doc title is: " + title
  #
  #   movie_or_tv = url.split(".com/")[1].split("/")[0]
  #   puts "movie_or_tv is: " + movie_or_tv
  #
  #   tomato_meter = doc.css("span.superPageFontColor")[0]
  #   puts "tomato_meter is: " + tomato_meter
  #
  #   audience_score = doc.css("span.superPageFontColor")[12]
  #   puts "audience_score is: " + audience_score
  # end

end
