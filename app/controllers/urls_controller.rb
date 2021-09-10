class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)
    if @url.valid?
      render :info
    else
      flash.alert = @url.errors.full_messages.join(",")
      render :new
    end
  end

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find_by!(token: params[:token])
    RegisterViewJob.perform_later(@url.token)
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
