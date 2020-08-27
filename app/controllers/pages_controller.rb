class PagesController < ApplicationController

  def home
    @customers = Customer.all

    if params[:query].present?
      @customers = Customer.multisearchable(params[:query])
    else
      @customers = Customer.all
    end

  end  
end
