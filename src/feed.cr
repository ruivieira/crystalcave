require "http/client"
require "xml"

class Item
  property title, link, pubDate, comments, description

  def initialize
    @title = ""
  end
end

class RSS
  property version, items

  def initialize
    @version = "2.0"
    @items = Array(Item).new
  end

  def self.parse(url : String)
    response = HTTP::Client.get url
    body = response.body
    feed = XML.parse(body)

    result = RSS.new

    version = feed.first_element_child
    if version
      result.version = version.as(XML::Node)["version"].as(String)
    end

    items = feed.xpath("//rss/channel/item").as(XML::NodeSet)
    result.items = items.map { |c|
      item = Item.new
      title = c.xpath_node("title").as(XML::Node)
      if title
        item.title = title.text.as(String)
      end
      item
    }

    return result
  end

  def to_s
    s = "version: #{@version}"
    return s
  end
end

feed = RSS.parse "https://news.ycombinator.com/rss"

puts feed.to_s

feed.items.each { |e| puts e.title }
