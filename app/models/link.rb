class Link < ApplicationRecord
    before_validation :generate_slug

    validates_presence_of :url
    validates :url, format: URI::regexp(%w[http https])
    validates_uniqueness_of :slug
    validates_length_of :url, within: 3..255, on: :create, message: "too long"
    validates_length_of :slug, within: 3..255, on: :create, message: "too long"

    def short
        Rails.application.routes.url_helpers.short_url(slug: self.slug, host: "localhost:3000")
    end

    def self.shorten(url)
        link = Link.where(url: url).first
        return link.short if link 
          
        link = Link.new(url: url)
        return link.short if link.save
    end
  
    def generate_slug
        self.slug = SecureRandom.uuid[0..6] if self.slug.blank?
        true
    end
end
