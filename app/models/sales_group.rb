class SalesGroup < ActiveRecord::Base
  has_many :sales_reps, :dependent => :nullify
  has_many :locations, :through => :sales_reps

  validates_presence_of :description
end
