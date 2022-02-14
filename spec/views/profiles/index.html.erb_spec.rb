require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        name: "Name",
        github_url: "Github Url",
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
        github_url: "Github Url",
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
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "#{Link.shorten("Github Url")}", count: 2
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
