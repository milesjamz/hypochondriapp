require_relative '../config/environment'
require 'tty-prompt'
require 'colorize'
require 'faker'
require 'artii'
require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../app/models/cli.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/investigator.rb'
require_relative '../app/models/condition.rb'
require_relative '../app/models/appointment.rb'

CommandLineInterface.start_cli