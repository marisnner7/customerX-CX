class Contact < ApplicationRecord
  belongs_to :customer

  validates :name, :cellphone, :emails, presence: true
end
