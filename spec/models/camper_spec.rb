require 'spec_helper'
# let :course { FactoryGirl.create(:course) }
describe Camper do
  let(:camper) { FactoryGirl.create(:camper) }

  subject { camper }

  it { should respond_to :name }
  it { should respond_to :account_balance }
  it { should respond_to :carts }
end
