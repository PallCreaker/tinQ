require 'rails_helper'

RSpec.describe "parent_categories/edit", :type => :view do
  before(:each) do
    @parent_category = assign(:parent_category, ParentCategory.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit parent_category form" do
    render

    assert_select "form[action=?][method=?]", parent_category_path(@parent_category), "post" do

      assert_select "input#parent_category_name[name=?]", "parent_category[name]"
    end
  end
end
