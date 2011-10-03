class AddMultiplierToContestant < ActiveRecord::Migration
  def self.up
    add_column :contestants, :multiplier, :integer
  end

  def self.down
    remove_column :contestants, :multiplier
  end
end
