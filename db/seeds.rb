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

# @master.each do |category, category_type, brand, model, description, price, image1, image2|
#   Product.create(category: category, category_type: category_type, brand: brand, model: model, description: description, price: price, image1: image1, image2: image2)
# end


 doc = Nokogiri::HTML(open("http://www.giuseppezanottidesign.com/us/man/category/sneakers"))

 begining_url = "http://www.giuseppezanottidesign.com/"

 ending_url = doc.css(".product .inner figure.native-hover a").map{|link| link["href"]}

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
 price = doc.at_css(".prices .price").content.gsub(/[$]/, "")
 price = (price, precision: 2)
 print price
 images = doc.css(".images a").map{|links| links["data-image"]}
 image1 = images[0].slice(2, images[0].length)
 image2 = images[1].slice(2, images[1].length)

Product.create(category: "shoes", category_type: "sneakers", brand: brand, model: model, description: description, price: price, image1: image1, image2: image2)
end



