class Resort < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  
  scope :by_nearest, lambda{ |latitude, longitude| order("ABS(ABS(`latitude` - #{latitude}) + ABS(`longitude`- #{longitude})) ASC") }

end
