require 'cloudinary'

if Cloudinary.config.api_key.blank?
  require './config'
end

puts 'My cloud name is:' + Cloudinary.config.cloud_name

## Upload two files using the Upload API:

# Use the uploaded filename as the asset's public ID + allow overwriting the asset with new versions.
upload1=Cloudinary::Uploader.upload("https://cloudinary-devs.github.io/cld-docs-assets/assets/images/model.jpg", 
    use_filename:true, 
    unique_filename:false,
    overwrite:true
    )

# Retrieve some attributes from the first upload response.

  puts "File size of the #{upload1['public_id']}.#{upload1['format']} #{upload1['resource_type']}: #{upload1['bytes']/1024} KB"     

# Manually set the asset's public ID + allow overwriting asset with new versions.

  upload2=Cloudinary::Uploader.upload("https://cloudinary-devs.github.io/cld-docs-assets/assets/images/coffee_cup.jpg", 
      public_id: "coffee", 
      unique_filename: false,
      overwrite: true
      )


# Retrieve some attributes from the second upload response.
  puts "File size of the #{upload2['public_id']}.#{upload2['format']} #{upload2['resource_type']}: #{upload2['bytes']/1024} KB"