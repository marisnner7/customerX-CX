class PagesController < ApplicationController
  def home
    @customers = Customer.all

    @customers = if params[:query].present?
                   Customer.search_by_name_and_email(params[:query])
                 else
                   Customer.all
                 end
  end
end
