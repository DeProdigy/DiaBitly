require 'rails_helper'

RSpec.describe ShortUrlGenerator do
  describe '#find_or_create' do
    it 'returns an existing url if initialized with the same original_url' do
      existing_url = ShortUrl.create(original_url: 'www.dia.com', redirect_url: '/abcdef')
      url = ShortUrlGenerator.new(original_url: 'www.dia.com').find_or_create

      expect(url).to eql existing_url
    end

    it 'creates a new url if shortened url does not exist' do
      generator = ShortUrlGenerator.new(original_url: 'www.dia.com')
      expect { generator.find_or_create }.to change { ShortUrl.count }.from(0).to(1)
    end

    it 'returns a newly created shortened url' do
      generator = ShortUrlGenerator.new(original_url: 'dia.co')
      expect(generator.find_or_create).to be_an_instance_of(ShortUrl)
    end

    it 'returns nil if fails validations' do
      generator = ShortUrlGenerator.new(original_url: 'garbage')
      expect(generator.find_or_create).to eql nil
    end
  end
end
