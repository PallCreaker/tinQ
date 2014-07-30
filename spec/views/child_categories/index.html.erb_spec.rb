require 'rails_helper'

RSpec.describe "child_categories/index", :type => :view do
  before(:each) do
    assign(:child_categories, [
      ChildCategory.create!(
        :parent_category_id => 1
      ),
      ChildCategory.create!(
        :parent_category_id => 1
      )
    ])
  end

  it "renders a list of child_categories" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
