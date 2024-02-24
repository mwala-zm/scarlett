require 'rails_helper'

RSpec.describe "crops/show", type: :view do
  before(:each) do
    assign(:crop, Crop.create!(
      name: "Name",
      growth_stage: "Growth Stage",
      description: "MyText",
      crop_family: "Crop Family"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Growth Stage/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Crop Family/)
  end
end
