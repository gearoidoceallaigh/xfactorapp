class Contestant < ActiveRecord::Base
  has_many :search_terms, :dependent => :destroy
  has_many :scores, :dependent => :destroy
  
  validates :name, :presence => true
end
