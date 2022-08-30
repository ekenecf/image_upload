# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require 'cloudinary'

run Rails.application
Rails.application.load_server



Cloudinary.config_from_url("cloudinary://574396557644797:WDg-ogQ7AihEerTW0zlIw_GrUZw@du8vi4oen")
Cloudinary.config do |config|
  config.secure = true
end