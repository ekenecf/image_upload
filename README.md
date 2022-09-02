## Upload Images using cloudinary and CarrierWave in rails app
Storing images in a database table is not recommended because it tends to perform poorly at scale, a performance nightmare.
Just imagine storing a million users with their pictures!!

## Set up rails app
set up new rails app ie rails new Image-upload -T

Create model ie User
rails generate model User name photo

rails generate controller Users
Then add this -
class UsersController < ApplicationController
  
    def index
      @users = User.all
    end
  
    def new
      @user = User.new
    end
  
    def create
      created_user = User.new(user_params)
  
      if created_user.save
        flash[:notice] = 'user created successfully.'
        redirect_to users_path(created_user)
      else
        flash[:error] = 'user create unsucessful!'
        @user = created_user
        render :new
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :photo)
    end
end

## Add gem
gem ‘carrierwave’
gem ‘cloudinary’
then bundle install

## in config/initializers/cloudinary.rb, add;

Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUDINARY_NAME']
  config.api_key = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
end

then add;  gem 'figaro'
run bundle exec figaro install

In config/application.yml, yours could be like this

development:
  cloud_name: "imageexample"
  api_key: "37335631736568937"
  api_secret: "3s258d44f1s2a22g22d23a3s3d22a3d2"

production:
  cloud_name: "imageexample"
  api_key: "98785549878945"
  api_secret: "3s258d44f1s2a22g22d23a3s3d22a3d2"

  Generate carrierWave uploader
  rails g uploader image

## In image_uploader.rb comment out the storage and store_dir lines since we are going to use Cloudinary.

class ImageUploader < CarrierWave::Uploader::Baseinclude 
  Cloudinary::CarrierWave
   CarrierWave.configure do |config|
    config.cache_storage = :file
   end
 def extension_whitelist
  %w[jpg jpeg gif png]
 end
end

## Finally to the user model, add
 mount_uploader :image, ImageUploader

Test with hopscotch.io or postman to see