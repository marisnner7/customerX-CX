class ContactsController < ApplicationController
  
  def index
    
  end
  
  def show
    

  end

  def new
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.new
    
  end


  def create
    @contact = Contact.new(contact_params)
    # we need `restaurant_id` to associate contact with corresponding cus@customer
    @customer = Customer.find(params[:customer_id])
    @contact.customer = @customer
    @contact.save
    
    
    if @contact.save
      redirect_to customer_path(@customer)
      else
        render :new
      end
    
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :emails, :cellphone)
  end
end
