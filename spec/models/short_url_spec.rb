require 'rails_helper'

RSpec.describe ShortUrl do
  describe 'validations' do
    context 'original_url' do
      it 'is not valid without :original_url' do
        short_url = ShortUrl.new
        expect(short_url.valid?).to be false
      end

      it 'is valid with a real URL' do
        short_url = ShortUrl.new(original_url: 'www.dia.com', redirect_url: 'abcdef')
        expect(short_url.valid?).to be true
      end
    end

    context 'redirect_url' do
      it 'is not valid without :redirect_url' do
        short_url = ShortUrl.new(original_url: 'www.dia.com')
        expect(short_url.valid?).to be false
      end

      it 'has a unique redirect_url' do
        short_url1 = ShortUrl.create(original_url: 'www.dia.com', redirect_url: 'abcdef')
        short_url2 = ShortUrl.new(original_url: 'www.notdia.com', redirect_url: 'abcdef')
        expect(short_url2.valid?).to be false
      end
    end
  end
end
