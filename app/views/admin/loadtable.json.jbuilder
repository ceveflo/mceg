json.data @archive do |item|
	json.title item.title
	json.date_publication item.date_publication.strftime("%Y/%m/%d")
	json.media_type item.media_type
	json.num_views item.num_views
	json.id item.id
end
