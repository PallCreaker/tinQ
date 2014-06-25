require 'rails_helper'

RSpec.describe "qynqyns/edit", :type => :view do
  before(:each) do
    @qynqyn = assign(:qynqyn, Qynqyn.create!(
      :count => 1
    ))
  end

  it "renders the edit qynqyn form" do
    render

    assert_select "form[action=?][method=?]", qynqyn_path(@qynqyn), "post" do

      assert_select "input#qynqyn_count[name=?]", "qynqyn[count]"
    end
  end
end
