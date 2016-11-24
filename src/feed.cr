require "http/client"
require "xml"

class RSS
  property version

  def initialize
    @version = "2.0"
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

    return result
  end

  def to_s
    s = "version: #{@version}"
    return s
  end
end

feed = RSS.parse "https://news.ycombinator.com/rss"

puts feed.to_s
