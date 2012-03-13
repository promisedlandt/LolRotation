module LolRotation
  class Configuration
    def initialize
      @news_page_url = "http://na.leagueoflegends.com/"
      @news_post_title = "Free Champion Rotation"
      @details_link_href_fragment = "/champions/"
    end

    def self.define_reader(name)
      eval <<-CODE
        def #{name}
          defined?(@#{name}) ? @#{name} : nil
        end
      CODE
    end

    def self.add_setting name
      attr_writer name
      define_reader name
    end

    add_setting :news_page_url
    add_setting :news_post_title
    add_setting :details_link_href_fragment
  end
end
