class Amazon

  def self.get_s3_upload_key
    bucket = ENV['S3_BUCKET']
    access_key = ENV['AWS_ACCESS_KEY_ID']
    secret = ENV['AWS_SECRET_ACCESS_KEY']
    key = "uploads/#{SecureRandom.uuid}"
    expiration = 5.minutes.from_now.utc.strftime('%Y-%m-%dT%H:%M:%S.000Z')
    max_filesize = 2.megabytes
    acl = 'public-read'
      sas = '201' # Tells amazon to redirect after success instead of returning xml
      policy = Base64.encode64(
        "{'expiration': '#{expiration}',
        'conditions': [
          {'bucket': '#{bucket}'},
          {'acl': '#{acl}'},
          {'success_action_status': '#{sas}'},
          ['starts-with', '$key', '#{key}'],
          ['content-length-range', 1, #{max_filesize}],
          ]}
          ").gsub(/\n|\r/, '')
      signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), secret, policy)).gsub(/\n| |\r/, '')
      return {access_key: access_key, key: key, policy: policy, signature: signature, sas: sas, bucket: bucket, acl: acl, expiration: expiration}
    end

end
