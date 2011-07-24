class RenameContestColumns < ActiveRecord::Migration
  def self.up
    rename_column :contests, :start, :contest_start
    rename_column :contests, :end, :contest_end
  end

  def self.down
  end
end
