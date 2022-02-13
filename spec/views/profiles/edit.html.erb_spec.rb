require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      name: "MyString",
      github_url: "MyString",
      github_user: "MyString",
      followers: 1,
      following: 1,
      stars: 1,
      last_year_contributions: 1,
      profile_picture_url: "MyString",
      organization: "MyString",
      location: "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[name]"

      assert_select "input[name=?]", "profile[github_url]"

      assert_select "input[name=?]", "profile[github_user]"

      assert_select "input[name=?]", "profile[followers]"

      assert_select "input[name=?]", "profile[following]"

      assert_select "input[name=?]", "profile[stars]"

      assert_select "input[name=?]", "profile[last_year_contributions]"

      assert_select "input[name=?]", "profile[profile_picture_url]"

      assert_select "input[name=?]", "profile[organization]"

      assert_select "input[name=?]", "profile[location]"
    end
  end
end
