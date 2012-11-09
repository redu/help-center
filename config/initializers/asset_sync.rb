if defined?(AssetSync) && Rails.env.production?
  AssetSync.configure do |config|
    s3 = HelpCenter::Application.config.s3
    config.fog_provider = 'AWS'
    config.aws_access_key_id = s3[:access_key_id]
    config.aws_secret_access_key = s3[:secret_access_key]
    config.fog_directory = s3[:bucket]
    config.gzip_compression = true

    # Increase upload performance by configuring your region
    # config.fog_region = 'eu-west-1'
    #
    # Don't delete files from the store
    # config.existing_remote_files = "keep"
    #
    # Automatically replace files with their equivalent gzip compressed version
    # config.gzip_compression = true
    #
    # Use the Rails generated 'manifest.yml' file to produce the list of files to
    # upload instead of searching the assets directory.
    # config.manifest = true
    #
    # Fail silently.  Useful for environments such as Heroku
    # config.fail_silently = true
  end
end
