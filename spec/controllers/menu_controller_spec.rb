RSpec.describe MenuController, type: :controller do
  describe ' POST /on_click_button_play when user no login' do
    it 'renders no content' do
      post "on_click_button_play"
      expect(response).to have_http_status(:no_content)
    end
  end

  describe ' POST /on_click_button_logout when user no login' do
    it 'renders no content' do
      post "on_click_button_logout"
      expect(response).to have_http_status(:found)
    end
  end
end
