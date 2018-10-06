class ReCompany < ApplicationRecord
  has_many :realtors
  has_many :houses
  validates :name, presence: true
  validates :website, presence: true,
            format: {
                with: /\A^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}\z/,
                message: 'Invalid Format'
            }
  validates :size, numericality: { only_integer: true, greater_than: 0 }
  validates :found_year, presence: true,
            numericality: {
                only_integer: true,
                greater_than_or_equal_to: 1800,
                less_than_or_equal_to: Date.today.year
            }
  validates :revenue, numericality: { only_integer: true }

end
