class House < ApplicationRecord
  belongs_to :re_company
  belongs_to :user
  has_many :potential_buyers
end
