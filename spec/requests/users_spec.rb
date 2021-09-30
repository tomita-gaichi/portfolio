require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /sessions/new' do
    it 'ログイン画面の表示に成功すること' do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users' do
    context 'ユーザーが存在する場合ログインできる' do
      before do
        @user = create(:user)
      end

      it "is valid" do
        sign_in @user
        get users_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
