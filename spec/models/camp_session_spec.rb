require 'spec_helper'

describe CampSession do
  let(:camp_session) { FactoryGirl.create(:camp_session) }

  subject { camp_session }

  it { should respond_to :name }
end
