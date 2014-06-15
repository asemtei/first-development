CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',   
    :aws_access_key_id      => 'AKIAJXGVNX674ITPGR2Q'  , #'ENV['AWS_BUCKET']',                        # required
    :aws_secret_access_key  => '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', #'ENV['AWS_ACCESS_KEY_ID']',                        # required
    :region                 => 'us-west-2',                 # optional, defaults to 'us-east-1'
    :path_style => true
  }
  config.fog_directory  = 'flix.akiro'                
end