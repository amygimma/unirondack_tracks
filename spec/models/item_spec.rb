require 'spec_helper'

describe Item do
  let(:item) { FactoryGirl.create(:item) }

  subject { item }

  it { should respond_to :name }
  it { should respond_to :price }
  it { should respond_to :quantity }
  it { should respond_to :sold }

end
