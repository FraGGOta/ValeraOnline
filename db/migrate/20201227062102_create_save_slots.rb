class CreateSaveSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :save_slots do |t|
      t.integer :account_id
      t.string :name
      t.integer :health
      t.integer :tired
      t.integer :funny
      t.integer :mana
      t.integer :money

      t.timestamps
    end
  end
end
