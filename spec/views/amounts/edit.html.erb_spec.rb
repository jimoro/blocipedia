require 'rails_helper'

RSpec.describe "amounts/edit", type: :view do
  before(:each) do
    @amount = assign(:amount, Amount.create!())
  end

  it "renders the edit amount form" do
    render

    assert_select "form[action=?][method=?]", amount_path(@amount), "post" do
    end
  end
end
