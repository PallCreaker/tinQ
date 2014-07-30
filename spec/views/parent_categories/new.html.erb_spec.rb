require 'rails_helper'

RSpec.describe "parent_categories/new", :type => :view do
  before(:each) do
    assign(:parent_category, ParentCategory.new(
      :name => "MyString"
    ))
  end

  it "renders new parent_category form" do
    render

    assert_select "form[action=?][method=?]", parent_categories_path, "post" do

      assert_select "input#parent_category_name[name=?]", "parent_category[name]"
    end
  end
end
