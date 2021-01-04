class Account < ApplicationRecord
  def crypt_get
    ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base[0..31])
  end

  def init(nick, passwd)
    self.login = nick
    self.password = crypt_get.encrypt_and_sign(passwd)
    stats_reset
    self.points = 0
    save
  end

  def check_password(passwd)
    passwd == crypt_get.decrypt_and_verify(password)
  end

  def new_password(passwd)
    self.password = crypt_get.encrypt_and_sign(passwd)
    save
  end

  def stats_apply(v_h, v_mana, v_money, v_f, v_t)
    health_set(v_h)
    mana_set(v_mana)
    money_set(v_money)
    funny_set(v_f)
    tired_set(v_t)
    self.points += 1
    save
  end

  def stats_reset
    self.health = 100
    self.mana = self.funny = self.money = self.tired = 0
    save
  end

  def lose_log
    if health <= 0
      'You loose! You died'
    elsif mana > 100
      'You loose! You are too drunk'
    elsif money.negative?
      "You loose! There's no money to pay off your debts."
    else
      ''
    end
  end

  def action_go_job
    if mana < 50 && tired < 10
      stats_apply(0, 30, 100, -5, 10)
      ''
    else
      'You cannot go job'
    end
  end

  def action_go_behold
    stats_apply(0, -10, 0, 1, 10)
  end

  def action_watch_series
    stats_apply(-5, 30, -20, 1, -5)
  end

  def action_go_bar
    stats_apply(-10, 60, -100, 1, 40)
  end

  def action_go_drink
    stats_apply(-80, 60, -150, 5, 80)
  end

  def action_go_sleep
    stats_apply(90, -50, -150, -3, -70)
  end

  def action_go_sing
    stats_apply(0, 10, 10, 1, 20)
    if mana - 10 >= 40 && mana - 10 <= 70
      money_set(50)
      'Bonus money!'
    else
      ''
    end
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
