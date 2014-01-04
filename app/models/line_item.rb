class LineItem < ActiveRecord::Base
	belongs_to :product
  	belongs_to :cart
  	# 文件 %depot%/app/models/line_item.rb
	def total_price
        product.price * quantity
	end
end
