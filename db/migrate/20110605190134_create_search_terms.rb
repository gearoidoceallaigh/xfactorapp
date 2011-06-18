class CreateSearchTerms < ActiveRecord::Migration
  def self.up
    create_table :search_terms do |t|
      t.string :value
      t.references :contestant

      t.timestamps
    end
    
    add_index :search_terms, :contestant_id
  end

  def self.down
    drop_table :search_terms
  end
end
