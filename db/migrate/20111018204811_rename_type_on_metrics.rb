class RenameTypeOnMetrics < ActiveRecord::Migration
  def self.up
    rename_column :metrics, :type, :tracking_type
  end

  def self.down
  end
end
