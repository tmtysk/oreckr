require 'fog'

class OreckrAws
  include Singleton

  def initialize
    if @setting = Setting.enabled
      AWS.config(access_key_id: @setting.access_key_id, secret_access_key: @setting.secret_access_key)
      setup_fog
    else
      raise OreckrError, 'setting unavailable.'
    end
  end

  def s3
    @s3 ? @s3 : @s3 = AWS::S3.new
  end

  def bucket
    @bucket ? @bucket : self.s3.buckets.create(@setting.s3_bucket_name)
  end

  def setup_fog
    unless @fog_ready
      if s = Setting.enabled
        CarrierWave.configure do |config|
          config.fog_credentials = {
            :provider               => 'AWS',
            :aws_access_key_id      => s.access_key_id,
            :aws_secret_access_key  => s.secret_access_key,
            # :region                 => "ap-northeast-1"
          }
          config.fog_directory  = s.s3_bucket_name
          config.fog_public     = true                                    # optional, defaults to true
          config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
          config.asset_host     = nil                                     # optional, defaults to nil
        end
        # TODO Setup Cloudfront
#        cdn = Fog::CDN.new({
#          :provider               => 'AWS',
#          :aws_access_key_id      => s.access_key_id,
#          :aws_secret_access_key  => s.secret_access_key,
#        })
#        cdn.distributions.create... # CarrierWave requires fog-1.3.x but the version is not support the newest API.
        # TODO Setup Glacier
        # Configure S3 bucket to transfer to Glacier afterward.
        
        @fog_ready = true
      else
        raise OreckrError, "AWS Setting unavailable."
      end
    end
  end



end
