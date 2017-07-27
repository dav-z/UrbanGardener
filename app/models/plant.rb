class Plant < ApplicationRecord
	has_many :user_plants
	has_many :users, through: :user_plants
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/default_pic.svg"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
