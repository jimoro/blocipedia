require 'rails_helper'

RSpec.describe "amounts/index", type: :view do
  before(:each) do
    assign(:amounts, [
      Amount.create!(),
      Amount.create!()
    ])
  end

  it "renders a list of amounts" do
    render
  end
end
