require 'rails_helper'

RSpec.describe 'Short URL', type: :feature do
  scenario 'User creates a new shortened URL' do
    visit '/'
    expect(current_path).to eql '/short_urls/new'

    fill_in :short_url_original_url, with: 'www.dia.com'
    click_button I18n.t('short_urls.new.submit')

    expect(page).to have_content I18n.t('short_urls.show.header')
  end

  scenario 'User can not create a new shortened URL' do
    visit '/'
    expect(current_path).to eql '/short_urls/new'

    fill_in :short_url_original_url, with: 'garbage'
    click_button I18n.t('short_urls.new.submit')

    expect(page).to have_content I18n.t('short_urls.create.fail')
    expect(current_path).to eql "/short_urls/new"
  end

  scenario 'Shortened URL already exists' do
    visit '/'

    url = ShortUrl.create(original_url: 'www.dia.com', redirect_url: '/abcdef')

    fill_in :short_url_original_url, with: 'www.dia.com'
    click_button I18n.t('short_urls.new.submit')

    expect(current_path).to eql "/short_urls/#{url.id}"
  end

  scenario 'Coming back to the existing shortened URL' do
    url = ShortUrl.create(original_url: 'www.dia.com', redirect_url: '/abcdef')

    visit "/short_urls/#{url.id}"

    expect(page).to have_content 'www.dia.com'
    expect(page).to have_content '/abcdef'
  end
end
