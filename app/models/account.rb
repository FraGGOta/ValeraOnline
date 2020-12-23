class Account < ApplicationRecord
  def info_accunt
    self.login + " " + self.password
  end
end
