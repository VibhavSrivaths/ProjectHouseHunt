class Realtor < ApplicationRecord
  belongs_to :user
  belongs_to :re_company
  has_many :houses, :through => :re_company
  scope :for_house, lambda { |house_id| joins(:houses, :re_company).where('houses.id = ?', house_id) }
end
