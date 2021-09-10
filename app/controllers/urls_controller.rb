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
    @url = Url.find_by!(token: params[:token])
    redirect_to @url.address
  end

  def info
    @url = Url.find_by!(token: params[:token])
  end

  private

  def url_params
    params.require(:url).permit(:address)
  end
end
