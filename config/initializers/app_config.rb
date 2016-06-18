if ENV['VALID_SUPER_ADMINS']
	Scorbordapp::Application.config.admins = ENV['VALID_SUPER_ADMINS'].split(',')
else
	raise "Environment is misconfigured.  See README.md"
end
