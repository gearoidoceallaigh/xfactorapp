class Contestant < ActiveRecord::Base
  has_many :search_terms, :dependent => :destroy
  
  validates :name, :presence => true
end
