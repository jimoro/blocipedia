require 'rails_helper'

RSpec.describe "amounts/show", type: :view do
  before(:each) do
    @amount = assign(:amount, Amount.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
