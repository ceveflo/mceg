require 'open-uri'
namespace :mceg do
  desc "image task"
  task :update_image do
  		a = Archive.order("id DESC").first

  		url = a.image
  		
		uri  = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = url.include?('https')

		response = http.request(
		  Net::HTTP::Get.new(uri.request_uri, {
	 	   'User-Agent' => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0'
	 	 })
		)
        path = "tmp/images"
        name = "some.jpeg"
	File.open(File.join(path, name), 'wb') { |f| f.write(response.body) }


  end
end