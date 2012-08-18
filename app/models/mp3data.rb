class Mp3data < ActiveRecord::Base
  attr_accessible :artist, :count, :date, :song
  validates :song, :presence => true

  before_save :checkCount

  def checkCount
end
