require 'rails_helper'

RSpec.describe "crops/new", type: :view do
  before(:each) do
    assign(:crop, Crop.new(
      name: "MyString",
      growth_stage: "MyString",
      description: "MyText",
      crop_family: "MyString"
    ))
  end

  it "renders new crop form" do
    render

    assert_select "form[action=?][method=?]", crops_path, "post" do

      assert_select "input[name=?]", "crop[name]"

      assert_select "input[name=?]", "crop[growth_stage]"

      assert_select "textarea[name=?]", "crop[description]"

      assert_select "input[name=?]", "crop[crop_family]"
    end
  end
end
