class PagesController < ApplicationController
  skip_before_action :authenticate_customer!, only: :home

  def home
    @customers = Customer.all

    @customer = if params[:query].present?
                  Customer.global_search(params[:query])
                else
                  Customer.all
                end
  end
end
