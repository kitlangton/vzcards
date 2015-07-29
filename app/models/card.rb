require 'uri'

class Card < ActiveRecord::Base
  belongs_to :template
  has_attached_file :image, :styles => { :thumb => "200x200>" }
  validates_attachment_content_type :image, content_type: ['application/pdf']

  def image_from_url(url)
    self.image = URI.parse(url)
    self.image_file_name = "#{self.image_file_name}.pdf"
  end
end
