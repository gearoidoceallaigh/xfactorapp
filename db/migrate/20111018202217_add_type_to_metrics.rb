class AddTypeToMetrics < ActiveRecord::Migration
  def self.up
    add_column :metrics, :type, :string
  end

  def self.down
    remove_column :metrics, :type
  end
end
