require 'rails_helper'

RSpec.describe 'Redirect', type: :feature do
  scenario 'User gets redirected to the original URL' do
    url = ShortUrl.create(original_url: 'www.dia.com', redirect_url: '/abcdef')
    visit url.redirect_url
    
    expect(current_host).to eql 'http://www.dia.com'
  end

  scenario 'User gets redirected back to root with invalid path' do
    visit '/garbage'

    expect(current_path).to eql '/short_urls/new'
    expect(page).to have_content I18n.t('redirects.show.fail')
  end
end
