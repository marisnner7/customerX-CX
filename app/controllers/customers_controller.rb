class CustomersController < ApplicationController
  
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    @customer.update(customer_params)

    redirect_to customer_path,  notice: 'customer was successfully updated.'
  end

  def destroy
    @customer.destroy
    redirect_to root_path, notice: 'customer was successfully destroyed.'
  end

  private
  
  def customer_params
    params.require(:customer).permit(:name, :telephone, :email, :register_day)
    
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
