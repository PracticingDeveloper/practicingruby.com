#!/usr/bin/env ruby

require 'yaml'

articles = YAML.load_file("article-dump.yaml")

# KEYS: [:slug, :title, :summary, :published, :issue_number, :volume, :body]

def create_yaml_frontmatter(article)
  puts '---'
  puts 'layout: post'
  puts "title:  \"#{article[:title]}\""
  puts "date: #{article[:published]}"
  puts 'categories: articles', 'author: Practicing Ruby'
  puts "pemalink: articles/#{article[:slug]}"
  puts "---\n\n"
end

def write_body(article)
  puts '> ' + article[:summary] + "\n"
  puts article[:body]
end

create_yaml_frontmatter(articles[0])
write_body(articles[0])
