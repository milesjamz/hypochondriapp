																README

HYPOCHONDRI-APP v 1.0 - diagnosing, curing, and creating all the world's illnesses since 05/10/2019
the mod 1 final project of ...
	- Chloe Liu
	- Wei Feng
	- Miles Marillo


									------======	INSTALLATION AND TROUBLESHOOTING	======------

HYPOCHONDRI-APP was written in SublimeText and Atom, and tested with Ruby 2.6.1p33 ...

If you're having problems running it, please make sure you have installed all the gems we require! 'bundle install' in terminal should do the trick. If you're still having problems, run rails db:migrate:status to make sure all of the necessary tables have been created!

We populated our extensive database with real data from a government database of clinical studies; we then turned them into SQLite files.

											------======	HOW IT WORKS	======------


HYPOCHONDI-APP allows you to create a user profile, with their own password and residence in one of 5 cities. Upon waking up in the morning, the user is given a real weather report, scraped from accuweather.com with Nokogiri, and then assigned an illness from our database at random - these range from the comical to quite serious. 

Once fallen ill, the user can make a appointment to see a doctor, and will be given an array of choices; real doctors culled from our database who have treated the illness the user suffers from. This creates an "appointment" instance which is saved in the user's history, and will persist in the database.

The user can also use our Data Analytics function to show hospitals that treat the illness they have, as well as a list of studies which have been done on their illness.

Once the user has seen a doctor, they are healed! They can no longer make doctor's appointments or look up their illness in data analytics. They can, however, go to bed, which will find them waking up the next morning a little under the weather...

				Thank you!
				team MiChloWei