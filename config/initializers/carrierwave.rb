CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJQRL67PS76M2FREA',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1'
  }

  config.fog_directory = 'tinq' if Rails.env.production?
  config.fog_directory = 'tinq-dev' if Rails.env.development?

end