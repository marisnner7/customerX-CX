class PagesController < ApplicationController

  def home
    @customers = Customer.all

    if params[:query].present?
      @customers = Customer.search_by_name_and_email(params[:query])
    else
      @customers = Customer.all
    end

  end  
end
