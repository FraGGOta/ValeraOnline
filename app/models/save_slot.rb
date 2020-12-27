class SaveSlot < ApplicationRecord
  def set_from_account(account, slotname)
    self.account_id = account.id
    self.name = slotname
    self.health = account.health
    self.mana = account.mana
    self.funny = account.funny
    self.money = account.money
    self.tired = account.tired
  end

  def base_init
    self.account_id = 0
    self.name = ''
    self.health = 100
    self.mana = 0
    self.funny = 0
    self.money = 0
    self.tired = 0
  end
end
