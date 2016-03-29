# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all


#### Create Product Dummy Data ####
products_list = [
  ["shoes", "sneakers", "Margiela", "Replica1", "My shoe description1 My shoe description1 My shoe description1 My shoe description1", 550, "http://product-images.barneys.com/is/image/Barneys/503226706_product_1?$pdp_flexH$", "http://images.bigcartel.com/bigcartel/product_images/165203293/max_h-1000+max_w-1000/IMG_1846.JPG"],
  ["shoes", "sneakers", "Margiela", "Replica2", "My shoe description My shoe description2 My shoe description2 My shoe description2", 4000, "http://product-images.barneys.com/is/image/Barneys/503226706_product_1?$pdp_flexH$", "http://images.bigcartel.com/bigcartel/product_images/165203293/max_h-1000+max_w-1000/IMG_1846.JPG"],
  ["shoes", "sneakers", "Margiela", "Replica3", "My shoe description3 My shoe description3 My shoe description3 My shoe description3", 400, "http://product-images.barneys.com/is/image/Barneys/503226706_product_1?$pdp_flexH$", "http://images.bigcartel.com/bigcartel/product_images/165203293/max_h-1000+max_w-1000/IMG_1846.JPG"],
  ["shoes", "sneakers", "Margiela", "Replica4", "My shoe description4 My shoe description4 My shoe description4 My shoe description4", 900, "http://product-images.barneys.com/is/image/Barneys/503226706_product_1?$pdp_flexH$", "http://images.bigcartel.com/bigcartel/product_images/165203293/max_h-1000+max_w-1000/IMG_1846.JPG"],
  ["shoes", "sneakers", "Margiela", "Replica5", "My shoe description5 My shoe description5 My shoe description5 My shoe description5", 1500, "http://product-images.barneys.com/is/image/Barneys/503226706_product_1?$pdp_flexH$", "http://images.bigcartel.com/bigcartel/product_images/165203293/max_h-1000+max_w-1000/IMG_1846.JPG"],
  ["shoes", "sneakers", "Margiela", "Replica6", "My shoe description6 My shoe description6 My shoe description6 My shoe description6", 3300, "http://product-images.barneys.com/is/image/Barneys/503226706_product_1?$pdp_flexH$", "http://images.bigcartel.com/bigcartel/product_images/165203293/max_h-1000+max_w-1000/IMG_1846.JPG"]
]


products_list.each do |category, category_type, brand, model, description, price, image1, image2|
  Product.create(category: category, category_type: category_type, brand: brand, model: model, description: description, price: price, image1: image1, image2: image2)
end


