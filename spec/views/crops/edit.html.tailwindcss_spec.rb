require 'rails_helper'

RSpec.describe "crops/edit", type: :view do
  let(:crop) {
    Crop.create!(
      name: "MyString",
      growth_stage: "MyString",
      description: "MyText",
      crop_family: "MyString"
    )
  }

  before(:each) do
    assign(:crop, crop)
  end

  it "renders the edit crop form" do
    render

    assert_select "form[action=?][method=?]", crop_path(crop), "post" do

      assert_select "input[name=?]", "crop[name]"

      assert_select "input[name=?]", "crop[growth_stage]"

      assert_select "textarea[name=?]", "crop[description]"

      assert_select "input[name=?]", "crop[crop_family]"
    end
  end
end
