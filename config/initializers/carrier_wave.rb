CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # Mention Fog provider
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'ZKK4BD7EVJSDAF6V2T08',
    aws_secret_access_key: 'jgBIXSbaurNrrClBm5py2mOzvL7sCz3xCN5fFyfj',
    region:                'us-east-1',                  # optional, defaults to 'us-east-1',
                                                         # Please mention other regions if you have changed
                                                         # minio configuration
    host:                  'minio.jetru.by',              # Provide your host name here, otherwise fog-aws defaults to
                                                         # s3.amazonaws.com
    endpoint:              'http://minio.jetru.by', # Required, otherwise defauls to nil
    path_style:         true                             # Required
  }
  config.fog_directory  = 'railsstation'					 # Bucket name
end
