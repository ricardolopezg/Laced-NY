require 'nokogiri'
require 'open-uri'

 doc = Nokogiri::HTML(open("http://www.giuseppezanottidesign.com/us/man/category/sneakers"))

 begining_url = "http://www.giuseppezanottidesign.com/"

 ending_url = doc.css(".product .inner figure.native-hover a").map{|link| link["href"]}
 print ending_url

 url = []

 for i in 0..ending_url.length-1 do
  url.push(begining_url + ending_url[i])
end


# print url.count

for i in 0..url.length-1 do
 doc = Nokogiri::HTML(open(url[i]))
 brand = "Giuseppe Zanotti"
 model = doc.at_css(".h1").content
 description = doc.at_css(".long-description p").content
 price = doc.at_css(".prices .price").content
 images = doc.css(".images a").map{|links| links["data-image"]}
 image1 = images[0]
 image2 = images[1]

 puts brand + " " + model + " " + price + " " + description + " " + image1 + " " + image2
 # puts brand
 # puts model
 # puts price
 # puts description
 # puts image1
 # puts image2
end
