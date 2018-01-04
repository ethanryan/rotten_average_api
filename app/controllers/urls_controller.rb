class UrlsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    urls = Url.all
    render json: urls
  end

  def create
    url = Url.new(url_params)
    url.save
    link = url.link
    url.parse_and_fix(link)
    render json: url
  end

  def url_params
    params.require(:url).permit(:link, :title, :movie_or_tv, :tomato_meter, :audience_score)
  end

end
