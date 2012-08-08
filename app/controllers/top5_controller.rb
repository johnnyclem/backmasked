class Top5Controller < ApplicationController
	def get
		@mp3s = Mp3data.all( :order => "count DESC", :limit => 5 ) 
	end
end
