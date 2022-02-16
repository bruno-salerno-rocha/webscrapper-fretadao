require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  let (:url) { "https://www.foo.com" }
  before(:each) do
    allow_any_instance_of(Profile).to receive(:scrape_attributes)
    assign(:profiles, [
      Profile.create!(
        name: "Name",
        github_url: url
      ),
      Profile.create!(
        name: "Name",
        github_url: url
      )
    ])
  end

  it "renders a list of profiles" do
    short_url = Link.where(url: url).first.short
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "#{short_url}", count: 2
  end
end
