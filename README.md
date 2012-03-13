# lolrotation - get IDs of the champions in the current free rotation


## Disclaimer

This gem scrapes the official League of Legends website - if they change the format of the news posts, this will break.

---

## Installation

Since this gem is completely unfinished and bad, it's not in the rubygems.org directory yet, so you'll have to install it directly from github:

```ruby
gem 'lolrotation', :git => 'git://github.com/promisedlandt/lolrotation.git'
```

### Dependencies

This gem uses [Nokogiri](http://nokogiri.org/) to parse the web site.

---

## Usage

After installation, simply call `LolRotation::Rotation.current` in your application.

The resultant hash currently has only one key, `:champion_ids`, which points to an array of the IDs of the currently free champions.

Example:

```ruby
result = LolRotation::Rotation.current    # {:champion_ids=>[12, 1, 14, 15, 26, 82, 81, 57, 101, 114]}
result[:champion_ids]                     # [12, 1, 14, 15, 26, 82, 81, 57, 101, 114]
```

---

## Error handling

The only error handling this gem provides is returning an empty champion_ids array if no news post with a matching title has been found. This means that a plethora of Exceptions from open-uri or Nokogiri can get thrown, and you'll need to handle them on your own.

---

## Configuration

LolRotation supports the following configuration options:

 * `news_page_url`: the url of the League of Legends news page you want to parse. Default: "http://na.leagueoflegends.com/"
 * `news_post_title`: the title fragment used to identify a news post about a new champion rotation. Default: "Free Champion Rotation"
 * `details_link_href_fragment`: the href fragment used to identify links to champion pages . Default: "/champions/"

You can set them in a configuration block like this:

```ruby
LolRotation.configure do |config|
  config.news_page_url = "http://eune.leagueoflegends.com"
  config.news_post_title = "We haff new rotation"
  config.details_link_href_fragment = "/heroes/"
end
```

The above example would try to find a post with the title "We haff new rotation" on http://eune.leagueoflegends.com (it's how they talk over there). Once found, it would search for links leading to pages with "/heroes/" in the path and use those to identify the champions.
