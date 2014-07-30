require 'rails_helper'

RSpec.describe "child_categories/edit", :type => :view do
  before(:each) do
    @child_category = assign(:child_category, ChildCategory.create!(
      :parent_category_id => 1
    ))
  end

  it "renders the edit child_category form" do
    render

    assert_select "form[action=?][method=?]", child_category_path(@child_category), "post" do

      assert_select "input#child_category_parent_category_id[name=?]", "child_category[parent_category_id]"
    end
  end
end
