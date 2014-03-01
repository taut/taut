$:.unshift("./lib")

require "bundler"
Bundler.require

require 'taut'

use Taut::GifMe

run Taut::Application


