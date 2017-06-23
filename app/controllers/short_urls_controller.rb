class ShortUrlsController < ApplicationController
  def new; end

  def create
    url = ShortUrlGenerator.new(url_params).find_or_create

    if url
      redirect_to short_url_path(url)
    else
      flash.notice = t('.fail')
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @url = ShortUrl.find(params[:id])
  end

  private

  def url_params
    params.require(:short_url).permit(:original_url)
  end
end
