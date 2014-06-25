require 'rails_helper'

RSpec.describe "qynqyns/index", :type => :view do
  before(:each) do
    assign(:qynqyns, [
      Qynqyn.create!(
        :count => 1
      ),
      Qynqyn.create!(
        :count => 1
      )
    ])
  end

  it "renders a list of qynqyns" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
