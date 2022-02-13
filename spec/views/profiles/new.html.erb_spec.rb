require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
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

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[name]"

      assert_select "input[name=?]", "profile[github_url]"
    end
  end
end
