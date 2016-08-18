xml.instruct!
xml.xml :version => '2.0', 'xmlns:itunes'=>'http://www.itunes.com/dtds/podcast-1.0.dtd'  do
  xml.channel do
    xml.title "Güiri Güiri al aire "
    xml.link "http://radio.grupodutriz.com/"
    xml.description "GDRadio"
    xml.tag!("itunes:author", "Grupo Dutriz")
    xml.language "es"
    xml.tag!("itunes:explicit" ,"clean")
    xml.tag!("itunes:owner") do 
        xml.tag!("itunes:name" , "Grupo Dutriz")
        xml.tag!("itunes:email" , "it@grupodutriz.com")
    end
    xml.tag!("itunes:image" , {"href"=>"#{request.protocol}#{request.host_with_port}#{asset_path('EG2014GUIRITUNES.png')}"}) 
    xml.tag!("itunes:category" , {"text" => "Sports &amp; Recreation"} , "")
    xml.copyright("Grupo Dutriz")

    for item in @archive
        xml.item do 
            lenght = tagmedia(item.media_files[0].url_file , item.category.id)
            xml.title item.title
            xml.pubDate l(item.date_publication , format: :long)
            xml.tag!("itunes:author","El Grafico")
            xml.tag!("itunes:subtitle" ,item.title)
            xml.tag!("itunes:summary" , item.media_files[0].description)
            xml.tag!("itunes:image" , {"href"=>"#{request.protocol}#{request.host_with_port}#{asset_path('EG2014GUIRITUNES.png')}"})
            xml.tag!("itunes:duration", lenght)
            xml.tag!("itunes:keywords" , item.media_tag)
            xml.tag!("guid" ,  {"isPermalink"=>true}  , item.media_files[0].url_file)
            xml.tag!("enclosure" , { "url"=>item.media_files[0].url_file , "length"=>lenght , "type"=>"audio/mpeg"})
        end
    end
  
  end
end
         
