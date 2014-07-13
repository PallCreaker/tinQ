require 'rails_helper'

RSpec.describe "child_categories/new", :type => :view do
  before(:each) do
    assign(:child_category, ChildCategory.new(
      :parent_category_id => 1
    ))
  end

  it "renders new child_category form" do
    render

    assert_select "form[action=?][method=?]", child_categories_path, "post" do

      assert_select "input#child_category_parent_category_id[name=?]", "child_category[parent_category_id]"
    end
  end
end
