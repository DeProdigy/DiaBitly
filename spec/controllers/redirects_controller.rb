require 'rails_helper'

RSpec.describe RedirectsController do
  describe '#show' do
    context 'not a valid redirect' do
      subject { get :show, params: { redirect_path: '/not_a_real_path' } }

      it 'redirects back to root' do
        expect(subject).to redirect_to(root_path)
      end
    end

    context 'valid redirect' do
      let(:short_url) { ShortUrlGenerator.new(original_url: 'google.com').find_or_create }

      subject { get :show, params: { redirect_path: short_url.redirect_url } }

      it 'redirects to the original url' do
        expect(subject).to have_http_status(:redirect)
      end
    end
  end
end
