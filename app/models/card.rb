class Card < ActiveRecord::Base
  belongs_to :template
  has_attached_file :image, :styles => { :thumb => "200x200>" }
  validates_attachment_content_type :image, :content_type => /\A.*\z/
end
