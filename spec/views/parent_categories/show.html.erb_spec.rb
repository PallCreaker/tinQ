require 'rails_helper'

RSpec.describe "parent_categories/show", :type => :view do
  before(:each) do
    @parent_category = assign(:parent_category, ParentCategory.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
