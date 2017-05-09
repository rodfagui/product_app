# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
	has_and_belongs_to_many :categories
	validates :name, presence: true
	validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end