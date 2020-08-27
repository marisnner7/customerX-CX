require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { Customer.new(name: 'Marianne', email: 'maria@gmail.com', password: '12345678') }

  before { subject.save }

  it 'name should be present' do
    subject.name = "marianne"
    expect(subject).to be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password should be not too short' do
    subject.password = '1234'
    expect(subject).to_not be_valid
  end
end
