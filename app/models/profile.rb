class Profile < ApplicationRecord
    validates :name, presence: true
    validates :github_url, presence: true, format: URI::regexp(%w[http https])

    before_save :shorten_github_url, :scrape_attributes

    def scrape_attributes
        slug = self.github_url.split('/').last
        url = Link.find_by_slug(slug).url
        scraper = ProfilesScraper.new(github_url: url)
        self.attributes = self.attributes.merge(
            scraper.get_profile_attributes
        )
    end
 
    def self.with_any_column_like(search_key)
        where("#{column_names.join(' || ')} ilike ?", "%#{search_key}%")         
    end

    private

    def shorten_github_url
        return unless self.github_url_changed?
        self.github_url = Link.shorten(self.github_url)
    end
end
