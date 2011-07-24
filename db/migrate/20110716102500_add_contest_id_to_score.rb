class AddContestIdToScore < ActiveRecord::Migration
  def self.up
    add_column :scores, :contest_id, :integer
  end

  def self.down
    remove_column :scores, :contest_id
  end
end
