require 'rails_helper'

RSpec.describe "Links", type: :request do
  let(:valid_attributes) {
    { url: "http://www.foo.com" }
  }

  describe "GET /show" do
    it "redirects to original url" do
      link = Link.create! valid_attributes
      get link.short
      expect(response).to redirect_to(valid_attributes[:url])
    end
  end

end
