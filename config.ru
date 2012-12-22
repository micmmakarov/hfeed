# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'handlebars_assets'
env = Sprockets::Environment.new
env.append_path HandlebarsAssets.path
run Hn::Application
