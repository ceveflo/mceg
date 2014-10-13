CarrierWave.configure do |config|
  config.fog_credentials = {
	:provider           => 'Rackspace',
    :rackspace_username => 'oscar.navidad',
    :rackspace_api_key  => '6fbc0378417246b3bbe3b5b60ff40381',
    :rackspace_region   => :ord                # optional, defaults to :dfw
  }
  config.fog_directory = 'ElGrafico_2014'

  
end