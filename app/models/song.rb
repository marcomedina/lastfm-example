class Song < ActiveRecord::Base
  attr_accessible :artist, :listeners, :title, :image
end
