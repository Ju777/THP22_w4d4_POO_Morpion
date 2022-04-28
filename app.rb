require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)

require 'app/application'
require 'app/game'
require 'app/player'
require 'app/board'
require 'app/boardcase'
require 'app/show'

application = Application.new
application.start_rounds
application.good_bye_message
