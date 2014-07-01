require 'rails_helper'

RSpec.describe "brands/index", :type => :view do
  before(:each) do
    assign(:brands, [
      Brand.create!(
        :name => "Name"
      ),
      Brand.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of brands" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
