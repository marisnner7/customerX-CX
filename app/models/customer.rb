class Customer < ApplicationRecord
  validates :name, presence: true 
  validates :telephone, presence: true 
  validates :register_day, presence: true, uniqueness: true 
end
