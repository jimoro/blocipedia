require 'rails_helper'

RSpec.describe "amounts/new", type: :view do
  before(:each) do
    assign(:amount, Amount.new())
  end

  it "renders new amount form" do
    render

    assert_select "form[action=?][method=?]", amounts_path, "post" do
    end
  end
end
