require "rails_helper"

RSpec.describe ProfilesScraper do
  let(:profile) {
      Profile.create!(
        name: "Bruno",
        github_url: "https://github.com/bruno-salerno-rocha"
      )
  }

  it 'fills remaning fields of Profile' do
    expect(profile.github_user).not_to be_nil
    expect(profile.followers).not_to be_nil
    expect(profile.following).not_to be_nil
    expect(profile.stars).not_to be_nil
    expect(profile.last_year_contributions).not_to be_nil
    expect(profile.profile_picture_url).not_to be_nil
    expect(profile.organization).not_to be_nil
    expect(profile.location).not_to be_nil
  end
end