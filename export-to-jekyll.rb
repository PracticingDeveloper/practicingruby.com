#!/usr/bin/env ruby

require 'yaml'

articles = YAML.load_file("article-dump.yaml")

# KEYS: [:slug, :title, :summary, :published, :issue_number, :volume, :body]

def yaml_frontmatter(article)
  front_matter = {
    'layout'     => 'post',
    'title'      => article[:title],
    'date'       => article[:published].strftime("%F"),
    'categories' => 'articles',
    'author'     => author(article),
    'permalink'  => "articles/#{article[:slug]}",
    'summary'    => article[:summary]
  }.to_yaml
  front_matter << "---\n\n"
end

def author(article)
  article[:summary][/\(w\. (.*)\)/, 1] || 'Gregory Brown'
end

def write_to_file(article)
  date = article[:published].strftime("%F")
  filename = "#{date}-#{article[:slug]}.md"

  output = yaml_frontmatter(article) + article[:body]
  File.write("_posts/#{filename}", output)
end

articles.each { |article| write_to_file(article) }
