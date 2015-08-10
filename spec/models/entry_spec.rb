require 'rails_helper'
require 'spec_helper'

RSpec.describe Entry, type: :model do
  describe "validations" do
  	it { should validate_presence_of :date }
  	it { should validate_presence_of :time }
  end

  describe "associations" do
  end

  it "defaults archived to false" do
  	expect(Entry.new).to_not be_archived
  end
end
