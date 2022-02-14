class Profile < ApplicationRecord
    validates :name, presence: true
    validates :github_url, presence: true, format: URI::regexp(%w[http https])

    before_save :shorten_github_url

    private

    def shorten_github_url
        self.github_url = Link.shorten(self.github_url)
    end
end
