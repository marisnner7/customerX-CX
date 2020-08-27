class ContactsController < ApplicationController
  before_action :set_contact, only: %i[destroy]
  
  def index
  @contacts = Contact.all
  end 

  def new
  # we need @customer in our `simple_form_for`
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.new
  end
  
  def edit
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    redirect_to customer_path(@customer)
  end  
  
  
  def create
    @contact = Contact.new(contact_params)
    # we need `customer_id` to associate contact with corresponding customer
    @customer = Customer.find(params[:customer_id])
    @contact.customer = @customer
    if @contact.save
    redirect_to customer_path(@customer)
    else
    render :new
    end
  end
  
  def destroy
  @contact.destroy
  redirect_to customer_path(@contact.customer)
  end
  
  private
  
  def set_contact
  @contact = Contact.find(params[:id])
  end
  
  def contact_params
  params.require(:contact).permit(:name, :emails, :cellphone)
  end

end