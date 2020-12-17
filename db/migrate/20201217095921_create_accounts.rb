class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :login
      t.string :password
      t.integer :health
      t.integer :tired
      t.integer :funny
      t.integer :mana
      t.integer :money
      t.integer :points

      t.timestamps
    end
  end
end
