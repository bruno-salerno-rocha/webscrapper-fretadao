require 'rails_helper'

RSpec.describe Profile, type: :model do

  let(:attributes) do
    {
      name: "Name",
      github_url: "http://www.foo.com"
    }
  end

  let(:scraped_attributes) do
    {
      github_user: "User",
      followers: 10,
      following: 10,
      stars: 5,
      last_year_contributions: 100,
      profile_picture_url: "/spec/img/logo.png",
      organization: "Organization",
      location: "Location"
    }
  end

  let(:profile) { Profile.create(attributes) }

  describe "#scrape_attributes" do

    it "sets the profile with the attributes from the scraper" do
      allow_any_instance_of(ProfilesScraper).to receive(:get_profile_attributes) { scraped_attributes }
      profile.scrape_attributes
      expect(profile.github_user).to eq(scraped_attributes[:github_user])
      expect(profile.followers).to eq(scraped_attributes[:followers])
      expect(profile.following).to eq(scraped_attributes[:following])
      expect(profile.stars).to eq(scraped_attributes[:stars])
      expect(profile.last_year_contributions).to eq(scraped_attributes[:last_year_contributions])
      expect(profile.profile_picture_url).to eq(scraped_attributes[:profile_picture_url])
      expect(profile.organization).to eq(scraped_attributes[:organization])
      expect(profile.location).to eq(scraped_attributes[:location])
    end

    it "maintain the original values of non scraped attributes" do
      allow_any_instance_of(ProfilesScraper).to receive(:get_profile_attributes) { scraped_attributes }
      profile.scrape_attributes
      expect(profile.name).to eq(attributes[:name])
      expect(profile.github_url).to eq(Link.shorten(attributes[:github_url]))
    end

  end

  describe "#self.with_any_column_like" do
    Profile.column_names.each do |column|
      it "can retrieve the profile by #{column}" do
        allow_any_instance_of(ProfilesScraper).to receive(:get_profile_attributes) { scraped_attributes }
        profile.save
        expect(
          Profile.with_any_column_like(attributes[column]).count
        ).to eq(1)
      end
    end
  end
end
