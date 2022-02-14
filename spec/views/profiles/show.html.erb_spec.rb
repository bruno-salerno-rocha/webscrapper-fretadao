require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    short_url = Link.create(url: "Github Url").short
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/#{short_url}/)
    expect(rendered).to match(/Github User/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Profile Picture Url/)
    expect(rendered).to match(/Organization/)
    expect(rendered).to match(/Location/)
  end
end
