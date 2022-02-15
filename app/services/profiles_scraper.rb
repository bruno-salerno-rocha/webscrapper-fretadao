require 'httparty'

class ProfilesScraper
    def initialize(github_url:)
        @github_url = github_url
        @attributes = {}
    end

    def get_profile_attributes
        html = HTTParty.get(@github_url)
        page = Nokogiri::HTML(html)
        @attributes[:github_user] = page.xpath(
            "//*[@id=\"js-pjax-container\"]/div[2]/div/div[1]/div/div[2]/div[1]/div[2]/h1/span[2]"
        ).text.strip
        @attributes[:followers] = page.xpath(
            "//*[@id=\"js-pjax-container\"]/div[2]/div/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/a[1]/span"
        ).text.strip.to_i
        @attributes[:following] = page.xpath(
            "//*[@id=\"js-pjax-container\"]/div[2]/div/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/a[2]/span"
        ).text.strip.to_i
        @attributes[:stars] = page.xpath(
            "//*[@id=\"js-pjax-container\"]/div[2]/div/div[2]/div[1]/nav/a[5]/span"
        ).text.strip.to_i
        @attributes[:last_year_contributions] = page.xpath(
            "//*[@id=\"js-pjax-container\"]/div[2]/div/div[2]/div[2]/div/div[2]/div/div[1]/div[1]/div[1]/h2"
        ).text.strip.split("\n").first.to_i
        @attributes[:profile_picture_url] = page.xpath(
            "//*[@id=\"js-pjax-container\"]/div[2]/div/div[1]/div/div[2]/div[1]/div[1]/a/img/@src"
        ).text
        @attributes[:organization] = page.xpath(
            "//*[@id=\"js-pjax-container\"]/div[2]/div/div[1]/div/div[2]/div[2]/div[2]/ul/li[@itemprop=\"worksFor\"]/span/div"
        ).text.split(" ").join(";")
        @attributes[:location] = page.xpath(
            "//*[@id=\"js-pjax-container\"]/div[2]/div/div[1]/div/div[2]/div[2]/div[2]/ul/li[@itemprop=\"homeLocation\"]/span"
        ).text
        @attributes
    end
end