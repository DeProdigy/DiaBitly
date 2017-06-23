class ShortUrl < ActiveRecord::Base
  validates :original_url, presence: true, url: true
  validates :redirect_url, presence: true, uniqueness: true
end
