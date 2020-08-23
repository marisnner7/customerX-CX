require 'rails_helper'

describe Customer do
  it "é válido quando contém o nome e telefone" do
    customer = Customer.new(name: "Marianne Aguiar", telephone: 99887744)

    expect(customer).to be_valid
  end
end


describe Customer do 
  it "é invalido sem data de registro" do 
   customer = Customer.new(register_day: nil) 
   customer.valid?   
   expect(customer.errors[:register_day]).not_to include("can't be blank") 
  end 
 end

 describe Customer do 
  it "é inválido caso já exista telefone igual" do 
   customer = Customer.create( name: 'Steve', telephone: 99887744 ) 
   customer = Customer.new( name: 'Bruce', telephone: 99887744 ) 
   customer.valid? 
   expect(customer.errors[:telephone]).to include('has already been taken')
  end 
 end