require 'rails_helper'
require 'support/factory_bot'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'when user direct in signup' do
      it 'renders new' do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end
end
