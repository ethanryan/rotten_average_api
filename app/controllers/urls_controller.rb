class UrlsController < ApplicationController

  def index
    urls = Url.all
    render json: urls
  end

end
