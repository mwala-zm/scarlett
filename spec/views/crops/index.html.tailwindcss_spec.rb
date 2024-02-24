require 'rails_helper'

RSpec.describe "crops/index", type: :view do
  before(:each) do
    assign(:crops, [
      Crop.create!(
        name: "Name",
        growth_stage: "Growth Stage",
        description: "MyText",
        crop_family: "Crop Family"
      ),
      Crop.create!(
        name: "Name",
        growth_stage: "Growth Stage",
        description: "MyText",
        crop_family: "Crop Family"
      )
    ])
  end

  it "renders a list of crops" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Growth Stage".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Crop Family".to_s), count: 2
  end
end
