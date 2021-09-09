class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)
  end

  def index
  end

  def show
  end

  private

  def url_params
    params.require(:url).permit(:address)
  end
end
