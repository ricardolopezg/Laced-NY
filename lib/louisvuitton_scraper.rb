require 'nokogiri'
require 'open-uri'

louisvuitton_sneakers_website = Nokogiri::HTML(open("http://us.louisvuitton.com/eng-us/men/shoes/t/sneakers/to-3"))

louisvuitton_sneakers_begining_url = "http://us.louisvuitton.com/"

louisvuitton_sneakers_ending_url = louisvuitton_sneakers_website.css("div#products-grid div.pl-page a").map{|link| link["href"]}

# puts louisvuitton_sneakers_ending_url
# print louisvuitton_sneakers_ending_url.count

louisvuitton_sneakers_full_product_url = []

for i in 0..louisvuitton_sneakers_ending_url.length-2 do
  louisvuitton_sneakers_full_product_url.push(louisvuitton_sneakers_begining_url + louisvuitton_sneakers_ending_url[i])
end

# puts louisvuitton_sneakers_full_product_url
# print louisvuitton_sneakers_full_product_url

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
end




