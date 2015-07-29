require 'uri'

class Card < ActiveRecord::Base
  belongs_to :template
  belongs_to :device
  has_attached_file :image, :styles => { :thumb => "200x200>" }
  validates_attachment_content_type :image, content_type: ['application/pdf']

  def image_from_url(url)
    self.image = URI.parse(url)
    self.image_file_name = "#{self.image_file_name}.pdf"
  end

  def variables
    { 'device' => self.device.alias,
      'device2' => self.device.alias2,
      '2yrp' => self.two_year_price,
      'frp' => self.full_retail_price,
      'eff' => self.effective_date,
    }
  end
end
