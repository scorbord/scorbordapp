class Highlight < ActiveRecord::Base

	belongs_to :prospect

	def embed_src
		prefix = "https://www.scorbord.com/"
		if self.source == 1
			prefix = "https://www.youtube.com/embed/"
		elsif self.source == 2
			prefix = "https://player.vimeo.com/video/"
		elsif self.source == 3
			prefix = "//www.hudl.com/embed/video/"
		end
		prefix + self.path
	end
end
