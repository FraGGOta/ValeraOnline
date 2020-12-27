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
end
