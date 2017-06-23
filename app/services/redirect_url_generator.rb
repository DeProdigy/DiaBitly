class RedirectUrlGenerator
  def generate
    # take current time UTC in seconds and map it to Radix
    "/#{Time.now.utc.to_i.to_s(36)}"
  end
end
