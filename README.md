# cfSnippets Site

A simple site for CFML example snippets and cheatsheets. See the [content repo](https://github.com/LearnCF/cfSnippets).

This website runs using the following stack:

* [ColdBox](https://www.coldbox.org/) because it's awesome.
* [ElasticSearch](https://www.elastic.co/elasticsearch/get-started) for super-fast content search.
* [cbElasticSearch](https://forgebox.io/view/cbelasticsearch) for interacting with ElasticSearch from CFML

## Quick Installation

1. Clone this repo to your local machine: `git clone learncf/cfsnippets-site`
2. Install project dependencies: `box install`
3. Start up an ElasticSearch instance with Docker: `docker run -d -p 9202:9200 -p 9303:9300 -e "discovery.type=single-node" --name cfsnippets_es elasticsearch:7.5.1`
4. Start the application: `box server start`

## The Good News

> For all have sinned, and come short of the glory of God ([Romans 3:23](https://www.kingjamesbibleonline.org/Romans-3-23/))

> But God commendeth his love toward us, in that, while we were yet sinners, Christ died for us. ([Romans 5:8](https://www.kingjamesbibleonline.org/Romans-5-8))

> That if thou shalt confess with thy mouth the Lord Jesus, and shalt believe in thine heart that God hath raised him from the dead, thou shalt be saved. ([Romans 10:9](https://www.kingjamesbibleonline.org/Romans-10-9/))
 
## Repository

Copyright 2020 (and on) - [Michael Born](https://michaelborn.me/)

* [Homepage](https://github.com/LearnCF/cfSnippets-site)
* [Issue Tracker](https://github.com/LearnCF/cfSnippets-site/issues)
* [New BSD License](https://github.com/LearnCF/cfSnippets-site/blob/master/LICENSE.txt)

[![cfmlbadges](https://cfmlbadges.monkehworks.com/images/badges/made-with-cfml.svg)](https://cfmlbadges.monkehworks.com) [![cfmlbadges](https://cfmlbadges.monkehworks.com/images/badges/tested-with-testbox.svg)](https://cfmlbadges.monkehworks.com) [![cfmlbadges](https://cfmlbadges.monkehworks.com/images/badges/powered-by-coffee.svg)](https://cfmlbadges.monkehworks.com) [![cfmlbadges](https://cfmlbadges.monkehworks.com/images/badges/i-can-bench-press-ben-nadel.svg)](https://cfmlbadges.monkehworks.com)