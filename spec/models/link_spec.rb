require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:url) { "http://www.foo.com" }
  let(:link) {
    Link.create(url: url)
  }

  describe "#short" do
    it "returns a link with a 7 digit slug" do
      expect(link.short.split("/").last.length).to be(7)
    end
  end

  describe "#self.shorten" do
    it "creates a new Link for new URLs" do
      expect {
        Link.shorten(url)
      }.to change(Link, :count).by(1)
    end

    it "creates only one Link for each URL" do
      expect {
        5.times { Link.shorten(url) }
      }.to change(Link, :count).by(1)
    end
  end
end
