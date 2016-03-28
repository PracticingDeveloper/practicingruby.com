#!/usr/bin/env ruby

require 'yaml'

articles = YAML.load_file("article-dump.yaml")

# KEYS: [:slug, :title, :summary, :published, :issue_number, :volume, :body]

def create_yaml_frontmatter(article)
  front_matter = {
    'layout'     => 'post',
    'title'      => article[:title],
    'date'       => article[:published].strftime("%F %R %z"),
    'categories' => 'articles',
    'author'     => 'Practicing Ruby',
    'permalink'  => "articles/#{article[:slug]}"
  }.to_yaml
  
  puts front_matter, "---\n\n"
end

def write_body(article)
  puts article[:body]
end

create_yaml_frontmatter(articles[0])
write_body(articles[0])
