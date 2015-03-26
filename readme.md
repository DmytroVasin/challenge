Web challenge 2015:
---------------
##### Task:
Create XML Sitemap generator for the sites based on [official](http://www.sitemaps.org/protocol.html) format.

##### Logic:

The user visit page with:
* Field to enter the site URL
* Buttons "generate"

The application should submit the form after that, the server generate XML Sitemap and submit
link to download the file.

The logic of the process should include an analysis of the main page of the site, obtaining
with root html links to the internal pages of the site and their corresponding analysis to Level 3.
If the link is external - the program ignores it. Internal links are links with the same domain.

Used:
---------------
* Sinatra
* ruby 2.1.5
* nokogiri
* builder
* json
* twitter-bootstrap

Heroku:
---------------
[heroku app](https://ua-web-challenge-2015.herokuapp.com/)

Installation and usage
---------------
Install the gem:
```
gem install bundler
bundle install
rackup

visit localhost:9292
```

TBD:
---------------
Error Handling.
