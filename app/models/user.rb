class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :phone, presence: true, length: { within: (9..10) }, numericality: { only_integer: true }

  ## Role definitions and mapping to user roles
  #
  #
  # method to map the roles
  def map_available_roles
    roles.each.map &:name
  end

  ##Role defs
  def admin?
    map_available_roles.include?('Admin')
  end

  def househunter?
    map_available_roles.include?('HouseHunter')
  end

  def realtor?
    map_available_roles.include?('Realtor')
  end


  ## Preferred contact method
  # def
  @@preferred_contact_types = [:text, :call, :email]

  def self.preferred_contact_types
    @@preferred_contact_types
  end

  # Default devise modules
 # devise :database_authenticatable, :registerable, :recoverable,:validatable, :remembrable
end
