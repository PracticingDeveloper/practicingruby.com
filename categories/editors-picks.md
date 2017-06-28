---
layout: page
title: Editor's picks
---

<div class="home">
  <ul class="post-list">
    {% assign posts = site.posts | where:"categories","editors-picks" %}
    {% for post in posts %}
      <li>
        <div class="post-link">
          <a href="{{ post.url | prepend: site.github.url }}">{{ post.title }}</a>
        </div>
        <div class="post-summary">{{ post.summary }}<br/><span class="post-meta">Issue {{ post.issue_number }} — {{ post.date | date: "%B %-d, %Y" }}</span></div>
      </li>
    {% endfor %}
  </ul>
</div>
