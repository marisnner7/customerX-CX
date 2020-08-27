require 'rails_helper'

RSpec.describe Contact, type: :model do

  before { subject.save }

  it "name should be present" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "email should be present" do
    subject.emails = nil
    expect(subject).to_not be_valid
  end

  it "cellphone should be present" do
    subject.cellphone = nil
    expect(subject).to_not be_valid
  end

  it { should belong_to(:customer) }

end