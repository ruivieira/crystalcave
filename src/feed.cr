require "rss"

feed1 = RSS.parse "https://news.ycombinator.com/rss"
feed2 = RSS.parse "http://www.datatau.com/rss"

feed1.items.each { |e| puts "title: #{e.title}\nlink: #{e.link}\npubDate: #{e.pubDate}\ndescription: #{e.description}\ncomments: #{e.comments}\n" + "---" }

puts "="*80

feed2.items.each { |e| puts "title: #{e.title}\nlink: #{e.link}\npubDate: #{e.pubDate}\ndescription: #{e.description}\ncomments: #{e.comments}\n" + "---" }
