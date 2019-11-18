require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }

  describe '#index' do
    context 'log in' do
      before do
        login user
        user.chats = create_list(:chat, 3)
        get :index
      end

      it 'assigns @chats' do 
        expect(assigns(:chats)).to eq user.chats
      end
      
      it 'redners index' do     
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end