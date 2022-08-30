class User < ApplicationRecord  
    mount_uploader :photo, ImageUploader

    validates :name, presence: true
    validates :photo, presence: true
end
  