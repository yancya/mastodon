require 'rails_helper'

describe Settings::PreferencesController do
  let(:user) { Fabricate(:user) }
  before do
    sign_in user, scope: :user
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    it 'udpates the user record' do
      put :update, params: { user: { locale: 'en' } }

      expect(response).to redirect_to(settings_preferences_path)
      expect(user.reload.locale).to eq 'en'
    end

    it 'updates user settings' do
      user.settings['boost_modal'] = false
      user.settings['notification_emails']['follow'] = false
      user.settings['interactions']['must_be_follower'] = true

      put :update, params: {
        user: {
          setting_boost_modal: '1',
          notification_emails: { follow: '1' },
          interactions: { must_be_follower: '0' }
        }
      }

      expect(response).to redirect_to(settings_preferences_path)
      user.reload
      expect(user.settings['boost_modal']).to be true
      expect(user.settings['notification_emails']['follow']).to be true
      expect(user.settings['interactions']['must_be_follower']).to be false
    end
  end
end
