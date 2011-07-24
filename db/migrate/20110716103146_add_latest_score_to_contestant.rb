class AddLatestScoreToContestant < ActiveRecord::Migration
  def self.up
    add_column :contestants, :latest_score, :integer
  end

  def self.down
    remove_column :contestants, :latest_score
  end
end
