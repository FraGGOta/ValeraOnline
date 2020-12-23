require 'rails_helper'
require 'support/factory_bot'

RSpec.describe Account, type: :model do
  it 'returns access info account' do
    account = build(:account, login: 'Josh', password: 'asdasd')
    expect(account.info_accunt).to eq 'Josh asdasd'
  end
end
