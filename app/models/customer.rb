class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model

  pg_search_scope :search_by_name_and_email,
                  against: %i[name email],
                  using: {
                    tsearch: { prefix: true }
                  }
  validates :name, :email, presence: true

  has_many :contacts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  def self.find_for_facebook_oauth(auth)
    customer_params = auth.slice('provider', 'uid')
    customer_params.merge! auth.info.slice('email', 'first_name', 'last_name')
    customer_params[:facebook_picture_url] = auth.info.image
    customer_params[:token] = auth.credentials.token
    customer_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    customer_params = customer_params.to_h

    customer = Customer.find_by(provider: auth.provider, uid: auth.uid)
    customer ||= Customer.find_by(email: auth.info.email) # Customer did a regular sign up in the past.
    if customer
      customer.update(customer_params)
    else
      customer = Customer.new(customer_params)
      customer.password = Devise.friendly_token[0, 20]  # Fake password for validation
      customer.save
    end

    customer
 end
end
