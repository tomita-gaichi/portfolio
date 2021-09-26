require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /sessions/new" do
    it 'ログイン画面の表示に成功すること' do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /sessions' do
    let(:req_params) { { session_form: { password: user.authenticatable_salt } } }
    context '存在するユーザーの場合' do
      binding.pry
      let(:user) { create(:user) }
      it 'ログインに成功する' do
        post user_session_path params: req_params
        expect(response).to redirect_to users_path
      end
    end

    context '存在しないユーザーの場合' do
      let(:user) { build(:user) }
      it 'ログインに失敗する' do
        post user_session_path params: req_params
        expect(response).to have_http_status(200)
      end
    end
  end
end
