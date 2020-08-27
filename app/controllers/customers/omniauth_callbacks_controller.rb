class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    customer = Customer.find_for_facebook_oauth(request.env['omniauth.auth'])

    if customer.persisted?
      sign_in_and_redirect customer, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to customer_facebook_omniauth_callback
    end
  end
end