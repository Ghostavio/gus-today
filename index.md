---
layout: default
title: Gustavo Siqueira
header_type: image
subtitle: Software Engineer from Brazil
header_img: /assets/images/potd/current.avif?v=2026-01-18
header_type: splash
include_on_search: false
---

<div class="container-lg py-5">
  <div class="row">
    <div class="col-lg-8 mx-auto text-center">
      
      <!-- Introduction -->
      <div class="mb-5">
        <h2 class="display-5 font-weight-bold mb-4">Welcome!</h2>
        <p class="lead">
          I'm a Software Engineer passionate about building elegant solutions to complex problems.
          This is where I share my journey, projects, and thoughts on software development.
        </p>
      </div>

      <!-- Quick Links -->
      <div class="row mb-5">
        <div class="col-md-6 mb-4">
          <div class="card h-100">
            <div class="card-body">
              <i class="fas fa-timeline fa-3x text-primary mb-3"></i>
              <h3 class="card-title">Career Timeline</h3>
              <p class="card-text">
                Explore my professional journey, projects, and the technologies I've worked with over the years.
              </p>
              <a href="/timeline/" class="btn btn-primary">View Timeline</a>
            </div>
          </div>
        </div>
        <div class="col-md-6 mb-4">
          <div class="card h-100">
            <div class="card-body">
              <i class="fas fa-blog fa-3x text-primary mb-3"></i>
              <h3 class="card-title">Blog</h3>
              <p class="card-text">
                Read my articles on software engineering, tutorials, best practices, and personal insights.
              </p>
              <a href="/blog/" class="btn btn-primary">Read Blog</a>
            </div>
          </div>
        </div>
      </div>

      <!-- Latest Blog Posts -->
      <div class="mb-5">
        <h3 class="mb-4">Latest Articles</h3>
        <div class="list-group">
          {% for post in site.posts limit:3 %}
            <a href="{{ post.url | relative_url }}" class="list-group-item list-group-item-action">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">{{ post.title }}</h5>
                <small class="text-muted">{{ post.date | date: "%b %d, %Y" }}</small>
              </div>
              {% if post.excerpt %}
                <p class="mb-1">{{ post.excerpt | strip_html | truncate: 150 }}</p>
              {% endif %}
              {% if post.tags %}
                <small class="text-muted">
                  {% for tag in post.tags limit:3 %}
                    <span class="badge badge-secondary">{{ tag }}</span>
                  {% endfor %}
                </small>
              {% endif %}
            </a>
          {% endfor %}
        </div>
      </div>

    </div>

  </div>
</div>
