class AddEliminationToContestants < ActiveRecord::Migration
  def self.up
    add_column :contestants, :eliminated, :boolean, :default => false
  end

  def self.down
    remove_column :contestants, :eliminated
  end
end
