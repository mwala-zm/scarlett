require 'rails_helper'

RSpec.describe "fields/index", type: :view do
  before(:each) do
    assign(:fields, [
      Field.create!(
        name: "Name",
        size: "Size",
        location: "Location"
      ),
      Field.create!(
        name: "Name",
        size: "Size",
        location: "Location"
      )
    ])
  end

  it "renders a list of fields" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Size".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Location".to_s), count: 2
  end
end
