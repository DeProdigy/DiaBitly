class ShortUrlGenerator
  def initialize(params)
    @original_url = params[:original_url]
  end

  def find_or_create
    if existing_url
      return existing_url
    else
      if new_url.save
        return new_url
      else
        return nil
      end
    end
  end

  private
  attr_reader :original_url, :existing_url, :new_url

  def existing_url
    @existing_url ||= ShortUrl.find_by(original_url: original_url)
  end

  def new_url
    @new_url ||= ShortUrl.new(
      original_url: original_url,
      redirect_url: RedirectUrlGenerator.new.generate,
    )
  end
end
