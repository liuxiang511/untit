class Product < ActiveRecord::Base

 belongs_to :firm_category,:class_name => "FirmCategory", :foreign_key => :firm_category_id
 has_many :product_calculates, dependent: :destroy


end