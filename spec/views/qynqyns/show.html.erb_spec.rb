require 'rails_helper'

RSpec.describe "qynqyns/show", :type => :view do
  before(:each) do
    @qynqyn = assign(:qynqyn, Qynqyn.create!(
      :count => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end
