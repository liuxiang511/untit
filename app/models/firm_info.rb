class FirmInfo < ActiveRecord::Base
  belongs_to :concat
  has_many :products, :dependent => :destroy

end