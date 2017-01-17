require 'rails_helper'

RSpec.describe "Amounts", type: :request do
  describe "GET /amounts" do
    it "works! (now write some real specs)" do
      get amounts_path
      expect(response).to have_http_status(200)
    end
  end
end
