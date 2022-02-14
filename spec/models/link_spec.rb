require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) {
    Link.create(url: "http://www.foo.com")
  }

  describe "#short" do
    it "returns a link with a 7 digit slug" do
      expect(link.short.split("/").last.length).to be(7)
    end
  end
end
