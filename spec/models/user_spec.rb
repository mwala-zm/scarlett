require 'rails_helper'

RSpec.describe User, type: :model do
  it "Must create new user" do
    expect(User.new).to be_ok
  end

  it "should be able to be deleted"
  it "must have name, location, contact details"
  it "should have an update details function/class"
end
