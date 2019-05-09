require_relative '../config/environment'
require 'tty-prompt'
require 'colorize'
require 'faker'
require 'artii'
require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/cli.rb'
require_relative '../lib/user.rb'
require_relative '../lib/doctor.rb'
require_relative '../lib/illness.rb'
require_relative '../lib/appointment.rb'

CommandLineInterface.start_cli