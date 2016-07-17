namespace :populate do

	desc 'populate database with required resources'
	task :super => :environment do
		User.create!(first_name: 'Steven', last_name: 'Holt', email: 'steven@scorbord.com', password: 'stressed', password_confirmation: 'stressed', admin: true)
	end
end
