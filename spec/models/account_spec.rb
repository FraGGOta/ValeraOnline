require 'rails_helper'
require 'support/factory_bot'

RSpec.describe Account, type: :model do
  describe 'stats operation' do
    it 'returns info account' do
      account = build(:account, login: 'Josh', password: 'asdasd')
      expect(account.info_accunt).to eq 'Josh asdasd'
    end

    it 'test set health' do
      account = build(:account, health: 0)
      account.health_set(10)
      expect(account.health).to eq 10
    end

    it 'test set mana up zero' do
      account = build(:account, mana: 0)
      account.mana_set(10)
      expect(account.mana).to eq 10
    end

    it 'test set mana below zero' do
      account = build(:account, mana: 0)
      account.mana_set(-10)
      expect(account.mana).to eq 0
    end

    it 'test set money up zero' do
      account = build(:account, money: 0)
      account.money_set(10)
      expect(account.money).to eq 10
    end

    it 'test set money below zero' do
      account = build(:account, money: 0)
      account.money_set(-10)
      expect(account.money).to eq 0
    end

    it 'test set funny below zero' do
      account = build(:account, funny: 0)
      account.funny_set(-30)
      expect(account.funny).to eq(-10)
    end

    it 'test set funny up zero' do
      account = build(:account, funny: 0)
      account.funny_set(30)
      expect(account.funny).to eq 10
    end

    it 'test set tired below zero' do
      account = build(:account, tired: 0)
      account.tired_set(-10)
      expect(account.tired).to eq 0
    end

    it 'test set tired up 100' do
      account = build(:account, tired: 0)
      account.tired_set(1000)
      expect(account.tired).to eq 100
    end

    it 'test load_from_saveslot' do
      (account = build(:account)).init_fields
      (slot = SaveSlot.new).base_init
      account.load_from_saveslot(slot)
      expect(account.health).to eq 100
    end

    it 'test set_from_account' do
      (account = build(:account)).init_fields
      (slot = SaveSlot.new).base_init
      slot.set_from_account(account, 'save_01')
      expect(slot.health).to eq 100
    end
  end
end
