require 'spec_helper'
# let :course { FactoryGirl.create(:course) }
describe Camper do
  subject { camper }
  it { should respond_to :name }
  it { should respond_to :account_balance }
end
