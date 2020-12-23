require 'rails_helper'
require 'support/factory_bot'

RSpec.describe Account, type: :model do
  it 'returns access write login' do
    account = build(:account, login: 'Josh')
    expect(account.login).to eq 'Josh'
  end
end
