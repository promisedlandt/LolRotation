module LolRotation
  class Rotation
    def self.current
      result = { champion_ids: [] }
      doc = Nokogiri::HTML(open(LolRotation.configuration.news_page_url))

      links = doc.xpath("//a[contains(text(), '#{ LolRotation.configuration.news_post_title }')]").collect { |link| link.attributes['href'].text }.uniq

      return result if links.empty?

      links.sort! { |link1, link2| link1.split('-').last.to_i <=> link2.split('-').last.to_i }

      doc = Nokogiri::HTML(open(LolRotation.configuration.news_page_url.addbs + links.last))

      detail_links = doc.xpath("//a[contains(@href, '#{ LolRotation.configuration.details_link_href_fragment }')]")

      result[:champion_ids] = detail_links.collect { |link| link.attributes['href'].value.split('/').last.to_i }

      result
    end
  end
end
