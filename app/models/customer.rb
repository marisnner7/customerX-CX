class Customer < ApplicationRecord
  validates :name, :telephone, :register_day, presence: true 
end
