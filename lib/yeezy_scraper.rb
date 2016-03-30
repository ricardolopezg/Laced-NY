require 'nokogiri'
require 'open-uri'

yeezy_array = []

yeezy = Nokogiri::HTML(open('http://www.flightclub.com/footwear/adidas/yeezy'))

yeezy_url = yeezy.css("ul.products-grid li div.item-container a.product-image").map{|link| link["href"]}

# print yeezy_url

for i in 0..yeezy_url.length-1 do
  yeezy_array.push(yeezy_url[i])
end

# print yeezy_array

for i in 0..yeezy_array.length-1 do
  yeezy = Nokogiri::HTML(open(yeezy_array[i]))
  brand = "Yeezy"
  model = yeezy.at("div.product-name h1").content
  # puts model
  description = "Yeezy's. No description necessary"
  price = yeezy.at("span.price").content
  # puts price
  image1 = yeezy.css('div.product-image a#main-image')[0]["href"]
  # print image1.chomp('1.jpg')
  image2 = image1.chomp('1.jpg') + "2.jpg"

  # Product.create(category: "shoes", category_type: "sneakers", brand: brand, model: model, description: description, price: price, image1: image1, image2: image2)
end

#  doc = Nokogiri::HTML(open("http://www.giuseppezanottidesign.com/us/man/category/sneakers"))

#  begining_url = "http://www.giuseppezanottidesign.com/"

#  ending_url = doc.css(".product .inner figure.native-hover a").map{|link| link["href"]}
#  # print ending_url

#  url = []
#  # @master = []
#  for i in 0..ending_url.length-1 do
#   url.push(begining_url + ending_url[i])
# end


# # print url.count

# for i in 0..url.length-1 do
#  doc = Nokogiri::HTML(open(url[i]))
#  brand = "Giuseppe Zanotti"
#  model = doc.at_css(".h1").content
#  description = doc.at_css(".long-description p").content
#  price = doc.at_css(".prices .price").content.gsub(/[$]/, "")
#  print price
#  puts "    "
#  images = doc.css(".images a").map{|links| links["data-image"]}
#  image1 = images[0].slice(2, images[0].length)
#  image2 = images[1].slice(2, images[1].length)

# # Product.create(category: "shoes", category_type: "sneakers", brand: brand, model: model, description: description, price: price, image1: image1, image2: image2)

# # @master.push(["Shoes", "sneakers", brand, model, description, price, image1, image2])
# end

# print @master

