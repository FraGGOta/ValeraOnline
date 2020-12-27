class Account < ApplicationRecord
  def info_accunt
    "#{login} #{password}"
  end

  def init_fields
    self.health = 100
    self.mana = 0
    self.funny = 0
    self.money = 0
    self.tired = 0
    self.points = 0
  end

  def stats_apply(v_h, v_mana, v_money, v_f, v_t)
    health_set(v_h)
    mana_set(v_mana)
    money_set(v_money)
    funny_set(v_f)
    tired_set(v_t)
  end

  def stats_reset
    self.health = 100
    self.mana = 0
    self.funny = 0
    self.money = 0
    self.tired = 0
  end

  def money_set(value)
    self.money = (money + value) <= 0 ? 0 : money + value
  end

  def funny_set(value)
    self.funny = (funny + value) <= -10 ? -10 : funny + value
    self.funny = funny > 10 ? 10 : funny
  end

  def tired_set(value)
    self.tired = (tired + value) <= 0 ? 0 : tired + value
    self.tired = tired > 100 ? 100 : tired
  end

  def mana_set(value)
    self.mana = (mana + value) <= 0 ? 0 : mana + value
  end

  def health_set(value)
    self.health = (health + value).negative? ? 0 : health + value
    self.health = health > 100 ? 100 : health
  end

  def load_from_saveslot(slot)
    self.health = slot.health
    self.mana = slot.mana
    self.funny = slot.funny
    self.money = slot.money
    self.tired = slot.tired
  end
end
