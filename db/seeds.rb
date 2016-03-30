# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#### Create Product Dummy Data ####

require 'nokogiri'
require 'open-uri'

Product.destroy_all

######### Giuseppe Zanotti 
 zanotti_sneakers = Nokogiri::HTML(open("http://www.giuseppezanottidesign.com/us/man/category/sneakers"))
 zanotti_begining_url = "http://www.giuseppezanottidesign.com/"
 zanotti_ending_url = zanotti_sneakers.css(".product .inner figure.native-hover a").map{|link| link["href"]}

 zanotti_url = []
 for i in 0..zanotti_ending_url.length-1 do
  zanotti_url.push(zanotti_begining_url + zanotti_ending_url[i])
end

for i in 0..zanotti_url.length-1 do
 doc = Nokogiri::HTML(open(zanotti_url[i]))
 brand = "Giuseppe Zanotti"
 model = doc.at_css(".h1").content
 description = doc.at_css(".long-description p").content
 price = doc.at_css(".prices .price").content.gsub(/[$]/, "")
 images = doc.css(".images a").map{|links| links["data-image"]}
 image1 = images[0].slice(2, images[0].length)
 image2 = images[1].slice(2, images[1].length)

Product.create(category: "shoes", category_type: "sneakers", brand: brand, model: model, description: description, price: price, image1: image1, image2: image2)
end


######### Maison Margiela 

maison_margiela_sneakers = Nokogiri::HTML(open("http://www.neimanmarcus.com/Maison-Margiela/Mens/Shoes/cat48130739/c.cat"))
margiela_begining_url = "http://www.neimanmarcus.com/"
margiela_ending_url = maison_margiela_sneakers.css(".product-image-frame a.product-thumbnail-image").map{|link| link["href"]}

margiela_url = []
for i in 0..margiela_ending_url.length-1 do
  margiela_url.push(margiela_begining_url + margiela_ending_url[i])
end

for i in 0..margiela_url.length-1 do 
  maison_margiela_sneaker = Nokogiri::HTML(open(margiela_url[i]))
  brand = "Maison Margiella"
  model = maison_margiela_sneaker.at_css(".product-name span").content
  description = maison_margiela_sneaker.at_css(".product-details-info li").content
  price = maison_margiela_sneaker.at_css(".lbl_ItemPriceSingleItem").content
  image_a = maison_margiela_sneaker.at('head meta[property="og:image"]')["content"].chomp("_mb.jpg")
  image1 = image_a + "_mu.jpg"
  image_b = maison_margiela_sneaker.at('head meta[property="og:image"]')["content"].chomp("_mb.jpg")
  image2 = image_b + "_au.jpg"

  Product.create(category: "shoes", category_type: "sneakers", brand: brand, model: model, description: description, price: price, image1: image1, image2: image2)
end


######### Louis Vitton
louisvuitton_sneakers_website = Nokogiri::HTML(open("http://us.louisvuitton.com/eng-us/men/shoes/t/sneakers/to-3"))
louisvuitton_sneakers_begining_url = "http://us.louisvuitton.com/"
louisvuitton_sneakers_ending_url = louisvuitton_sneakers_website.css("div#products-grid div.pl-page a").map{|link| link["href"]}

louisvuitton_sneakers_full_product_url = []
for i in 0..louisvuitton_sneakers_ending_url.length-2 do
  louisvuitton_sneakers_full_product_url.push(louisvuitton_sneakers_begining_url + louisvuitton_sneakers_ending_url[i])
end

for i in 0..louisvuitton_sneakers_full_product_url.length-1 do
  doc = Nokogiri::HTML(open(louisvuitton_sneakers_full_product_url[i]))
  brand = doc.at('head meta[name="author"]')['content']
  # print brand
  model = doc.at("#productName h1").content
  description = doc.at("#productPictures .productDescription").content
  price = doc.at(".priceValue").content.gsub(/[$]/, "")
  # image1 = doc.css('.zoomableContainer img').map{|i| i['src']}
  image1 = doc.at('head meta[property="og:image"]')['content']
  image2 = image1

  Product.create(category: "shoes", category_type: "sneakers", brand: brand, model: model, description: description, price: price, image1: image1, image2: image2)
end


######### Yeezy
yeezy = Nokogiri::HTML(open('http://www.flightclub.com/footwear/adidas/yeezy'))
yeezy_url = yeezy.css("ul.products-grid li div.item-container a.product-image").map{|link| link["href"]}

yeezy_array = []
for i in 0..yeezy_url.length-1 do
  yeezy_array.push(yeezy_url[i])
end

for i in 0..yeezy_array.length-1 do
  yeezy = Nokogiri::HTML(open(yeezy_array[i]))
  brand = "Yeezy"
  model = yeezy.at("div.product-name h1").content
  description = "Yeezy's. No description necessary"
  price = yeezy.at("span.price").content
  image1 = yeezy.css('div.product-image a#main-image')[0]["href"]
  image2 = image1.chomp('1.jpg') + "2.jpg"

  Product.create(category: "shoes", category_type: "sneakers", brand: brand, model: model, description: description, price: price, image1: image1, image2: image2)
end


