class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_plants
  has_many :plants, through: :user_plants
  has_many :user_recipes
  has_many :recipes, through: :user_recipes
  has_attached_file :propic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/images/default_pic.svg"
  validates_attachment_content_type :propic, content_type: /\Aimage\/.*\z/
  def full_name
    "#{fname} #{lname}".strip
  end
end