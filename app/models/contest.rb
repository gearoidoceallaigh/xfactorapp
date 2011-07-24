class Contest < ActiveRecord::Base
  has_many :scores, :dependent => :destroy
end
