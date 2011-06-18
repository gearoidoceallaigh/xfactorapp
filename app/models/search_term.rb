class SearchTerm < ActiveRecord::Base
  belongs_to :contestant
  
  validates_uniqueness_of :value, :message => 'Search term is already taken!'
  validates_presence_of :value
end
