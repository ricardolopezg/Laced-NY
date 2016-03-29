require 'nokogiri'
require 'open-uri'


# Fetch and parse HTML document
# doc = Nokogiri::HTML(open('http://www.giuseppezanottidesign.com/us/man/category/sneakers'))

# ending_url = doc.css(".product .inner figure.native-hover a").map{|links| links['href']}


  doc = Nokogiri::HTML(open('http://www.giuseppezanottidesign.com/us/man/category/sneakers'))
  ending_url = doc.css(".product .inner figure.native-hover a").map{|links| links['href']}
  url = []

for i in 0..ending_url.length-1 do
  url.push("http://www.giuseppezanottidesign.com/us/man/category/sneakers" + ending_url[i])
end

for i in 0..url.length-1 do
  doc = Nokogiri::HTML(open(url[i]))
  model = doc.at_css(".h1").content
  description = doc.at_css(".long-description p").content
  price = doc.at_css(".prices .price").content
  images = doc.css("ul.images a").map{|links| links['data-image']}
  image1 = images[0]
  image2 = images[1]
  brand = "Giuseppe Zanotti"
  puts brand + " " + model + " " + description + " " + price + " " + image1 + " " + image2
end

