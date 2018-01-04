class UrlsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    urls = Url.all
    render json: urls
  end

  def create
    #  make a new url with title and user_id from params
    #url = Url.new(story_params)
    url = Url.new(url_params) #need to save before calling below???
    #puts "new url is: " + url
    puts " ~ ~ ~ ~ ~ ~ ~ new url in create action"
    url.save

    link = url.link

    puts " ~ ~ ~ ~ ~ ~ ~ calling url.parseHTML(link)...."

    url.parseHTML(link) #calling parseHTML method in url model
    url.save

    url.fix_title
    url.fix_tomato_meter
    url.fix_audience_score
    puts " ~ ~ ~ ~ ~ ~ ~ calling fix_title, fix_tomato_meter, fix_audience_score"
    url.save

    puts " * * * * * * * * * * * * * * saving url, then rendering json: url"

    render json: url
  end


  def parse_and_fix
    # url.save
    # puts "saving new url"
    url.parseHTML(url.link) #calling parseHTML method in url model
    puts "calling parseHTML(url.link)"

    #url.create_content("genre", "story_characters") #calling createContent method in url model
    url.save
    puts "saving url"

    url.fix_title
    url.fix_tomato_meter
    url.fix_audience_score
    puts "calling fix_title, fix_tomato_meter, fix_audience_score"
    url.save
  end


  #private --- don't need this to be private!

  def url_params
    #below works in postman, when i don't require :url, but doesn't in react ...
    #params.permit(:url, :link, :title, :movie_or_tv, :tomato_meter, :audience_score)

    params.require(:url).permit(:link, :title, :movie_or_tv, :tomato_meter, :audience_score)
  end

end
