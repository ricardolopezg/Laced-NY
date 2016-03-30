require 'nokogiri'
require 'open-uri'


 maison_margiela_sneaker = Nokogiri::HTML(open("http://www.neimanmarcus.com/Maison-Margiela/Mens/Shoes/cat48130739/c.cat"))

 begining_url = "http://www.neimanmarcus.com/"

 ending_url = maison_margiela_sneaker.css(".product-image-frame a.product-thumbnail-image").map{|link| link["href"]}
 # print begining_url
 # print ending_url

 url = []

 for i in 0..ending_url.length-1 do
  url.push(begining_url + ending_url[i])
end


puts url.count




for i in 0..url.length-1 do 
 maison_margiela_sneaker = Nokogiri::HTML(open(url[i]))

 brand = "Maison Margiella"
model = maison_margiela_sneaker.at_css(".product-name span").content
 
# puts model 

 description = maison_margiela_sneaker.at_css(".product-details-info li").content


# puts description

price = maison_margiela_sneaker.at_css(".lbl_ItemPriceSingleItem").content
# puts price



image_a = maison_margiela_sneaker.at('head meta[property="og:image"]')["content"].chomp("_mb.jpg")
image1 = image_a + "_mu.jpg"
image_b = maison_margiela_sneaker.at('head meta[property="og:image"]')["content"].chomp("_mb.jpg")
image2 = image_b + "_au.jpg"
# puts image1
# puts image2
# puts "  "

end