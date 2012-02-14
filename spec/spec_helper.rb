require 'rubygems'
require 'bundler'

Bundler.require(:default, :runtime, :test)
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'pivotal-tracker'
require 'rspec'

autoload :RailsKoans, 'rails_koans'

PROJECT_ID = ENV['PROJECT_ID'] || "102622"
TOKEN = '8358666c5a593a3c82cda728c8a62b63'

PivotalTracker::Client.token = TOKEN