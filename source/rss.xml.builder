# -*- coding: utf-8 -*-
xml.instruct!
xml.rss "xmlns:atom" => "http://www.w3.org/2005/Atom", "version" => "2.0" do
  xml.channel do
    xml.id "http://blog.dasixi.com"
    xml.title "DASIXI"
    xml.link "http://blog.dasixi.com"
    xml.language "zh-cn"
    xml.copyright "&#x2117; &amp; &#xA9; 2013 dasixi.com"
    xml.link "href" => "http://blog.dasixi.com"
    xml.link "href" => "http://blog.dasixi.com/rss.xml", "rel" => "self"
    xml.updated blog.articles.first.date.to_time.iso8601
    xml.lastBuildDate blog.articles.first.date.to_time.iso8601
    xml.pubDate blog.articles.first.date.to_time.iso8601
    xml.description "Dasixi bitcoin arbitrage"
    xml.author { xml.name "dasixi" }

    blog.articles.each do |article|
      xml.item do
        xml.title article.title
        xml.link "http://blog.dasixi.com#{article.url}"
        xml.description article.body, "type" => "html"
        xml.guid "tag:blog.dasixi.com,article.url"
        xml.pubDate article.date.to_time.iso8601
        xml.category article.tags.join(', ')
      end
    end
  end
end
