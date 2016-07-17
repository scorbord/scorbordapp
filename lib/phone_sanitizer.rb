module PhoneSanitizer
	def sanitize(*attrs)
		attrs.each do |attribute|
			define_method("#{attribute}=") do |value|
				self[attribute] = value.gsub(/\D+/,'')
			end
		end
	end
end
