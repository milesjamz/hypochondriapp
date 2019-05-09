class CommandLineInterface

def self.start_cli
system 'clear'

	    art = puts <<-'EOF'

            .----.
           ===(_)==   THIS WONT HURT A BIT...
          // O  O \\  /                  _______              _   _         ___.   ___         ___
          (    L   )                    /       \ ___        | | | |  __   / __|  |   \  __.  / __|
           \ '--' /                     |  | |  | |  \ ____  | | | | |  | | /     | | | |  | | /
            \_ ._/                      |  |=|  | | □| ____  |  =. | | □| ||      | | | | □| || 
           __)  (__                     |  | |  | |__/       | | | | |__| | \__   | | | |__| | \__. 
        /"`/`\`V/`\`\                   |__| |__|            |_| |_|.     \____|  |___/      \____|
       /   \  `Y _/_ \                  
      / [DR]\_ |/ / /\                  ==============      ====================  =================
      |     ( \/ / / /
       \  \  \      /
        \  `-/`  _.`
         `=. `=./
            ```



    EOF
    art
 		menu_prompt
 	end

# => opening menu
 def self.menu_prompt
	prompt = TTY::Prompt.new
	puts "Hello, and welcome to team MiChloWei's Award Winning App - AD HOC DOC!".cyan
	# binding.pry
	choices = ["1-Sign In               🖋", "2-Create A New Profile  👶", "3-Credits               😘", "4-Exit                  🚪", "5-Reset All Records     🔥"]
	click = prompt.select('What would you like to do?'.bold, choices)
	if click == "1-Sign In               🖋"
		CommandLineInterface.sign_in
	elsif click == "2-Create A New Profile  👶"
		CommandLineInterface.create_profile
	elsif click == "3-Credits               😘"
		CommandLineInterface.credits
	elsif click == "4-Exit                  🚪"
		CommandLineInterface.exit_cli
	elsif click == "5-Reset All Records     🔥"
		CommandLineInterface.destroy_all
	end
end

# => create a new profile
	def self.create_profile
		prompt = TTY::Prompt.new
		pill = prompt.decorate('💊')
		prompt.collect do
		username = key(:name).ask('Please create a unique username:')
			if User.find_by(name: username)
			puts "We're sorry, but this username already exists in our records. Perhaps you meant to log in?"
			sleep 2
			system 'clear'
			CommandLineInterface.start_cli
			end
		user_password = key(:password).mask('Create your password:'.bold, mask: pill)
		$current_user = User.create(password: user_password, name: username, illness: "Healthy")
			end
		puts "You've successfully created a new profile, #{$current_user.name}!"
		sleep 3
		new_day
	end

# => sign in
	def self.sign_in
		prompt = TTY::Prompt.new
		pill = prompt.decorate('💊')
		prompt.collect do
			sign_in_name = key(:name).ask("What is your username?".bold)
			if !User.find_by(name: sign_in_name)
			puts "We're sorry, but there's no record of you! Let's go back to the main menu."
			sleep 2.5
			CommandLineInterface.start_cli
		else
			if User.find_by(name: sign_in_name)
			sign_in_password = key(:password).mask("Please enter your password:".bold,mask: pill)
			if !User.find_by(password: sign_in_password)
				puts "Sorry, but the password you entered doesn't match the one we have on file! Let's go back to the main menu."
				sleep 2.5
				CommandLineInterface.start_cli
		else
			$current_user = User.find_by(name: sign_in_name)
		CommandLineInterface.new_day
			end
		end
	end
end
end

# => credits

	def self.credits
	system 'clear'
		puts "                              ····------========== ".red + " C R E D I T S ".blue.bold.blink + " ==========------····".red
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts "                        This app was made in May 2019 by Chloe Liu, Wei Feng, and Miles Marillo.".red 
		sleep 3 
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts "            They would like to thank their parents, their instructors, and most importantly YOU, the user.".red
		sleep 3
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts ""
		puts "                                                   Bye!".red
		sleep 3
		start_cli
	end	

# => beginning of program! ------

	def self.new_day
		prognosis = Illness.random_illness
		system 'clear'
		doc = Nokogiri::HTML(open('https://www.accuweather.com/en/us/new-york-ny/10007/current-weather/349727'))
		puts "Good morning, #{$current_user.name}! It is currently #{doc.css(".phrase").children.text.downcase} in NYC."
		sleep 2
		if $current_user.illness != "Healthy"
			puts "You're still sick with #{$current_user.illness}. You should see a doctor!"
			sleep 2
			bedroom_one
		elsif $current_user.illness == "Healthy"
			puts "Uh-oh, you woke up feeling ill! It seems as if you've come down with #{prognosis}."
			sleep 1.5
			puts " ------------->  ".red + "    🛏  😷    " + "  <-------------".red
			$current_user.update(illness: prognosis)
		sleep 2
		bedroom_one
		end
	end

# => main "lounge" area; waking up after sleep or logging in

	def self.bedroom_one
		repeated_phrase = "You're in your bedroom, logged in to Ad-Hoc Doc."
		roommate_random = rand(1..4)
			if roommate_random == 1
		puts "#{repeated_phrase} Down the hall, you hear your roommate cracking open a #{Faker::Beer.name}."
		sleep 2
		bedroom_two
			elsif roommate_random == 2
		puts "#{repeated_phrase} Down the hall, you hear your roommate scarfing down some #{Faker::Food.dish}."	
		sleep 2
		bedroom_two
			elsif roommate_random == 3
		puts "#{repeated_phrase} Down the hall, you can smell the #{Faker::Coffee.blend_name} coffee your roommate is brewing."
		sleep 2
		bedroom_two
			elsif roommate_random == 4
		puts "#{repeated_phrase} Down the hall, you can hear your roommate blaring a #{Faker::Music.band} album."
		sleep 2
		bedroom_two
			end
	end

# => sub-menu if you are healthy

	def self.bedroom_two
		prompt = TTY::Prompt.new
		if $current_user.illness != "Healthy"
		sick_room
		elsif $current_user.illness == "Healthy"
		room_choices = [{ name: "1 - Schedule an appointment with a doctor", disabled: "(You're nice and healthy!)" }, "2 - Look at your profile", "3 - Go to bed", "4 - Delete your profile and return to Main Menu", "5 - Exit App"]
		room_choice = prompt.select("What would you like to do?".bold, room_choices)
			if room_choice == "2 - Look at your profile"
				profile_manager
			elsif room_choice == "3 - Go to bed"
				sweet_slumber
			elsif room_choice == "4 - Delete your profile and return to Main Menu"
				delete_profile
			elsif room_choice == "5 - Exit App"
				exit_cli
		end
	end
end

# => sub-menu if you are sick

	def self.sick_room
		prompt = TTY::Prompt.new
		room_choices = ["1 - Schedule an appointment with a doctor", "2 - Look at your profile", "3 - Go to bed", "4 - Delete your profile and return to Main Menu", "5 - Exit App"]
		room_choice = prompt.select("What would you like to do?".bold, room_choices)
		if room_choice == "1 - Schedule an appointment with a doctor"
			choose_doc
		elsif room_choice == "2 - Look at your profile"
			profile_manager
		elsif room_choice == "3 - Go to bed"
			sweet_slumber
		elsif room_choice == "4 - Delete your profile and return to Main Menu"
			delete_profile
		elsif room_choice == "5 - Exit App"
			exit_cli
		end
	end
# end

# => finds out if you have a history of doctors appoinments ...

	def self.profile_manager
		myappts = Appointment.all.select {|apt| apt.user_id == $current_user.name}
		docs = nil
			if myappts.length == 0
				then docs = "You have no appointments in your history!"
			print_history(docs)
			elsif myappts.length != 0
				then docs = myappts.map {|apt| "#{apt.doctor_id}" + " - " + "#{apt.date}"}
			print_history(docs)
			end
	end

# => prints out your appointment history

	def self.print_history(docs)
		puts "------------------------------------------------------------"
		puts "|Your name: #{$current_user.name}                           "
		puts "------------------------------------------------------------"
		sleep 2
		puts "|Your current health: #{$current_user.illness}"
		puts "------------------------------------------------------------"
		sleep 2
		puts "|Your appointment history: #{docs} "
		sleep 5
	system 'clear'
	bedroom_two
	end
# end

	def self.delete_profile
		$current_user.delete
		sleep 1
		puts "User profile successfully deleted!"
		sleep 2
		system 'clear'
		start_cli
	end

# => go to sleep, begin new phase

	def self.sweet_slumber
		system 'clear'
		puts "💤🛌"
		sleep 2
		puts "🌙"
		sleep 2
		puts "💤🛌"
		sleep 4
	new_day
	end

# => randomly selects doctors

	def self.choose_doc
		prompt = TTY::Prompt.new
		doctors = ["#{Investigator.random_investigator}", "#{Investigator.random_investigator}", "#{Investigator.random_investigator}"]
		choice = prompt.select("Please choose a doctor!".bold, doctors)
		appt_made(choice)
	end

	def self.appt_made(choice)
		random_transport = rand(1..3)


		puts "You have made an appointment with #{choice}! Time to leave the house and go get better."
			Appointment.create(user_id: $current_user.name, doctor_id: choice, date: Time.now)
		sleep 2

		puts "Let's go!"
			if random_transport == 1
				puts "🚆"
				sleep 1.5
				CommandLineInterface.go_to_appt(choice)
			elsif random_transport == 2
				puts "🚌"
				sleep 1.5
				CommandLineInterface.go_to_appt(choice)
			elsif random_transport == 3
				puts "🏃"
				sleep 1.5
				CommandLineInterface.go_to_appt(choice)
			end
	end

	def self.go_to_appt(choice)
		puts "You're in #{choice}'s office. You notice a motivational poster hanging on the wall, with a picture of a #{Faker::Creature::Animal.name} and the words '#{Faker::Marketing.buzzwords}' underneath it."
		sleep 2
		puts "You wait."
		sleep 2
		puts "And wait."
		sleep 3
		puts "And waaaaiiiiiiitttt...."
		sleep 2
		puts "Finally, #{choice} is ready to see you!" 
		sleep 1.5
		puts "After a thorough examination(and some strong prescription medication), you're already feeling better..."
		$current_user.update(illness: "Healthy")
		sleep 3
		puts "With a spring in your step, you head back to your apartment."
		sleep 4
		system 'clear'
		bedroom_two
	end


	def self.destroy_all
		system 'clear'
		prompt = TTY::Prompt.new
		yesno = ["Yes", "No"]
		puts "                              ☠ ☠ ☠ ☠ " + "   W A R N I N G   ".bold.red + "☠ ☠ ☠ ☠ "
		puts ""
		puts "         This will irreversibly destroy all User and Doctor Appointment records."
		puts ""
		puts ""
		puts ""
		sleep 1
		choice = prompt.select("Are you sure you wish to proceed?".bold, yesno)
			if choice == "Yes"
				User.destroy_all
				Appointment.destroy_all
				puts "All records destroyed! Returning to menu..."
				sleep 2
				start_cli
			elsif choice == "No"
				puts "Records NOT reset - returning to menu..."
				sleep 2
				start_cli
			end
	end

	def self.exit_cli
		system 'clear'
		puts ""
		puts ""
		puts ""
		puts "                                   Thank you for using our app!".yellow
		sleep 1
		puts ""
		puts ""
		puts ""
		puts ""
		puts "                     May you be happy 😎 and healthy 🏥 the rest of your days."
		sleep 1
		puts "                                      (c) 2019 team MiChloWei"
		sleep 3
		system 'clear'
		abort
	end

end