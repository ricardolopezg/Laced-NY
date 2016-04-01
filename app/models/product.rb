class Product < ActiveRecord::Base


  scope :brand, -> (brand) { where brand: brand }

end
