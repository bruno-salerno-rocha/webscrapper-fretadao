require "rails_helper"

RSpec.describe ProfilesScraper do

  describe "#get_profile_@scraper_attributes" do
    before(:each) do
      scraper = ProfilesScraper.new(
        github_url: "https://github.com/bruno-salerno-rocha"
      )
      VCR.use_cassette("github_profile") { @scraper_attributes = scraper.get_profile_attributes }
    end
    
    it "return a Hash" do
      expect(@scraper_attributes).to be_a(Hash)
    end

    it "contains all @scraper_attributes of profile excpet name and github_url" do
      expect(@scraper_attributes).to have_key(:github_user)
      expect(@scraper_attributes).to have_key(:followers)
      expect(@scraper_attributes).to have_key(:following)
      expect(@scraper_attributes).to have_key(:stars)
      expect(@scraper_attributes).to have_key(:last_year_contributions)
      expect(@scraper_attributes).to have_key(:profile_picture_url)
      expect(@scraper_attributes).to have_key(:organization)
      expect(@scraper_attributes).to have_key(:location)
    end

    it "gets the right information from my github page" do
      expect(@scraper_attributes[:github_user]).to eq("bruno-salerno-rocha")
      expect(@scraper_attributes[:followers]).to eq(0)
      expect(@scraper_attributes[:following]).to eq(0)
      expect(@scraper_attributes[:stars]).to eq(1)
      expect(@scraper_attributes[:last_year_contributions]).to eq(30)
      expect(@scraper_attributes[:profile_picture_url]).to eq("https://avatars.githubusercontent.com/u/21284377?v=4")
      expect(@scraper_attributes[:organization]).to eq("@Lesath-Corportation;@FuiOrganization;Teste;Teste2")
      expect(@scraper_attributes[:location]).to eq("São Paulo")
    end
  end
end