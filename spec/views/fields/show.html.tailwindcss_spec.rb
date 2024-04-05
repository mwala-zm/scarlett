require 'rails_helper'

RSpec.describe "fields/show", type: :view do
  before(:each) do
    assign(:field, Field.create!(
      name: "Name",
      size: "Size",
      location: "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/Location/)
  end
end
