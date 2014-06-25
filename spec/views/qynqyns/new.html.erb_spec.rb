require 'rails_helper'

RSpec.describe "qynqyns/new", :type => :view do
  before(:each) do
    assign(:qynqyn, Qynqyn.new(
      :count => 1
    ))
  end

  it "renders new qynqyn form" do
    render

    assert_select "form[action=?][method=?]", qynqyns_path, "post" do

      assert_select "input#qynqyn_count[name=?]", "qynqyn[count]"
    end
  end
end
