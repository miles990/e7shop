class Product < ActiveRecord::Base
	validates :description, :image_url, :title, :presence => {:message => "不得為空欄位"}
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
	   with: %r{\.(gif|jpg|png)\z}i,
	   message: 'must be a URLforGIF, JPGor PNGimage.'
	}

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private
   def ensure_not_referenced_by_any_line_item
     if line_items.empty?
       return true
     else
        errors.add(:base, 'Line Items present')
        return false
     end
   end
end
