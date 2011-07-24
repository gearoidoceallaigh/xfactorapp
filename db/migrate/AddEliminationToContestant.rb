class AddEliminationToContestant < ActiveRecord::Migration
  
  def self.up
    change_table :contestants do |t|
      t.boolean :eliminated, :default => false
    end
  end
  
  def self.down
    remove_column :contestants, :eliminated
  end

end
