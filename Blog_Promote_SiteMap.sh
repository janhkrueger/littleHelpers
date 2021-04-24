#!/bin/sh

# Sends an info to the search engines that something on your blog has changed.
curl http://www.google.com/webmasters/sitemaps/ping?sitemap=http://www.example.com/sitemap.xml > /dev/null 2>&1
curl http://www.bing.com/ping?sitemap=http://www.example.com/sitemap.xml > /dev/null 2>&1
curl http://blogs.yandex.ru/pings/?status=success&url=http://www.example.com/sitemap.xml > /dev/null 2>&1
