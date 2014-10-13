xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title ""
    xml.description "Videos, Galerías, Audios, Infografías."
    xml.link rss_url

    for post in @archive
      xml.item do
        xml.title post.title
        xml.pubDate post.date_publication.to_s(:rfc822)
        xml.author 'El Grafico'
        xml.link video_url(post)
        xml.guid video_url(post)
      end
    end
  end
end