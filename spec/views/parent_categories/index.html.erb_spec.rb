require 'rails_helper'

RSpec.describe "parent_categories/index", :type => :view do
  before(:each) do
    assign(:parent_categories, [
      ParentCategory.create!(
        :name => "Name"
      ),
      ParentCategory.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of parent_categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
