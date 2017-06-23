require 'rails_helper'

RSpec.describe RedirectUrlGenerator do
  describe '.generate' do
    it 'returns a short identifier' do
      url = RedirectUrlGenerator.new.generate
      expect(url.length).to eql 7
    end

    it 'has a path' do
      url = RedirectUrlGenerator.new.generate
      expect(url).to include '/'
    end
  end
end
