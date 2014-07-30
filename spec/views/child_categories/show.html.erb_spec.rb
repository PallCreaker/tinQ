require 'rails_helper'

RSpec.describe "child_categories/show", :type => :view do
  before(:each) do
    @child_category = assign(:child_category, ChildCategory.create!(
      :parent_category_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end
