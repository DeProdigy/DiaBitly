class RedirectsController < ApplicationController
  def show
    url = ShortUrl.find_by(redirect_url: "/#{params[:redirect_path]}")

    if url
      redirect_path = url.original_url.include?('http') ? url.original_url : "http://#{url.original_url}"
      redirect_to redirect_path
    else
      flash.notice = t('.fail')
      redirect_to root_path
    end
  end
end
