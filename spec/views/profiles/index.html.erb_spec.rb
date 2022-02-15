require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  let (:url) { "https://github.com/bruno-salerno-rocha" }
  before(:each) do
    allow_any_instance_of(Profile).to receive(:scrape_attributes)
    assign(:profiles, [
      Profile.create!(
        name: "Name",
        github_url: url,
        github_user: "Github User",
        followers: 2,
        following: 3,
        stars: 4,
        last_year_contributions: 5,
        profile_picture_url: "Profile Picture Url",
        organization: "Organization",
        location: "Location"
      ),
      Profile.create!(
        name: "Name",
        github_url: url,
        github_user: "Github User",
        followers: 2,
        following: 3,
        stars: 4,
        last_year_contributions: 5,
        profile_picture_url: "Profile Picture Url",
        organization: "Organization",
        location: "Location"
      )
    ])
  end

  it "renders a list of profiles" do
    short_url = Link.where(url: url).first.short
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "#{short_url}", count: 2
    assert_select "tr>td", text: "Github User".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: "Profile Picture Url".to_s, count: 2
    assert_select "tr>td", text: "Organization".to_s, count: 2
    assert_select "tr>td", text: "Location".to_s, count: 2
  end
end
