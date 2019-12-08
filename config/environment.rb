require 'bundler'
Bundler.require
# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActiveRecord::Base.logger = nil
