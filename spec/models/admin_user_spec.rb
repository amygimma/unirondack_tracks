require 'spec_helper'

describe AdminUser do
  let(:admin) { FactoryGirl.create(:admin_user) }

  subject { admin }

  it { should respond_to :email }
  it { should respond_to :password }
end
