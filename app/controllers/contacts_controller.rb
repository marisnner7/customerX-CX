class ContactsController < ApplicationController
  
  before_action :set_contact, only: %i[destroy]

  
  def new
    # we need @customer in our `simple_form_for`
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.new
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
  
  def edit
    @customer = Customer.find(params[:customer_id])
   @contact = @customer.contacts

  end

  def update
    @customer = Customer.find(params[:customer_id])
    @contact = @customer.contact.find(params[:id])
    @contact.update(contact_params)
    redirect_to customer_path, notice: 'contact was successfully updated.'
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
