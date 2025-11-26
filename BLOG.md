# Blog Section - Content Guide

## Overview
The blog section contains technical articles, tutorials, and personal thoughts about software engineering.

---

## Directory Structure

```
_posts/                           # Blog posts directory
├── 2024-11-25-post-title.md     # Format: YYYY-MM-DD-slug.md
└── 2024-12-01-another-post.md

assets/
└── images/
    └── posts/                    # Blog post images
        ├── 2024-11-25/
        └── 2024-12-01/

blog/
└── index.html                    # Blog index with pagination
```

---

## Post Template

Create posts in `_posts/` directory with format: `YYYY-MM-DD-post-slug.md`

```yaml
---
layout: post
title: "Your Awesome Blog Post Title"
subtitle: "An optional subtitle for more context"
date: 2024-11-25 14:30:00 -0300
last_modified_at: 2024-11-26 10:00:00 -0300
author: Gustavo Siqueira

# Categories and Tags
categories: 
  - Web Development
  - Backend
tags: 
  - nodejs
  - javascript
  - api
  - tutorial

# Header Configuration
header_type: hero              # Options: base, post, hero, image, splash
header_img: /assets/images/posts/2024-11-25/header.jpg  # Optional
header_img_credit: Photo by Name  # Optional
header_img_credit_link: https://unsplash.com/photo/xxx  # Optional

# SEO
description: "A compelling description for search engines and social media"
excerpt: "A short excerpt that appears in post listings"

# Feature Flags
show_date: true
show_tags: true
show_categories: true
show_author: true
show_comments: false           # Comments disabled by default
show_related: true             # Show related posts
show_sociallinks: true         # Share buttons
show_bottomnavs: true          # Previous/Next navigation
include_on_search: true
include_on_feed: true

# Optional: Custom Open Graph image for social sharing
og_image: /assets/images/posts/2024-11-25/og-image.jpg
---

## Introduction

Start your post with an engaging introduction that hooks the reader.

## Main Content

### Section 1

Your content here with proper markdown formatting.

```javascript
// Code examples with syntax highlighting
function example() {
  console.log("Hello World");
}
```

### Section 2

More content...

## Conclusion

Wrap up your post with key takeaways.
```

---

## Post Front Matter Options

### Required Fields
- `layout`: Must be "post"
- `title`: Post title
- `date`: Publication date in format `YYYY-MM-DD HH:MM:SS TIMEZONE`

### Optional Fields

#### Content
- `subtitle`: Additional context below the title
- `excerpt`: Short summary (auto-generated from content if not provided)
- `description`: Meta description for SEO (defaults to excerpt)

#### Taxonomy
- `categories`: Array of categories (e.g., `[Web Development, Tutorial]`)
- `tags`: Array of tags (e.g., `[javascript, react, hooks]`)

#### Author
- `author`: Author name (defaults to site author)

#### Header Types
- `header_type`: 
  - `base`: Simple header with title
  - `post`: Standard post header with metadata
  - `hero`: Large hero section with background
  - `image`: Full-width image header
  - `splash`: Full-screen splash header

#### Images
- `header_img`: Path to header image
- `header_img_credit`: Image credit text
- `header_img_credit_link`: Link to image source
- `og_image`: Custom Open Graph image for social sharing

#### Display Options (all boolean)
- `show_date`: Show publication date
- `show_tags`: Show tags
- `show_categories`: Show categories
- `show_author`: Show author info
- `show_comments`: Enable comments
- `show_related`: Show related posts
- `show_sociallinks`: Show social share buttons
- `show_bottomnavs`: Show prev/next navigation
- `show_breadcrumb`: Show breadcrumb navigation

#### Search & Feed
- `include_on_search`: Include in site search
- `include_on_feed`: Include in RSS/Atom feeds
- `published`: Set to `false` to hide post (default: `true`)

---

## Writing Tips

### Code Blocks

Use fenced code blocks with language specification for syntax highlighting:

````markdown
```javascript
const greeting = "Hello World";
console.log(greeting);
```
````

Available languages: `javascript`, `python`, `java`, `ruby`, `css`, `html`, `bash`, `json`, `yaml`, `markdown`, etc.

### Images

```markdown
![Alt text](/assets/images/posts/2024-11-25/image.jpg)
```

With caption:
```markdown
![Alt text](/assets/images/posts/2024-11-25/image.jpg)
*Caption text goes here*
```

### Links

```markdown
[Link text](https://example.com)
```

External links automatically open in new tab (configured in theme).

### Callouts/Alerts

Use Bootstrap alert classes:

```markdown
{: .alert .alert-info}
💡 **Pro Tip**: This is an informational callout.

{: .alert .alert-warning}
⚠️ **Warning**: Be careful with this approach.

{: .alert .alert-danger}
🚨 **Danger**: This can cause serious issues.

{: .alert .alert-success}
✅ **Success**: This is the recommended approach.
```

### Emphasis

```markdown
**Bold text**
*Italic text*
~~Strikethrough~~
`Inline code`
```

### Lists

Unordered:
```markdown
- Item 1
- Item 2
  - Nested item
  - Another nested item
- Item 3
```

Ordered:
```markdown
1. First item
2. Second item
3. Third item
```

### Tables

```markdown
| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
```

### Quotes

```markdown
> This is a blockquote.
> It can span multiple lines.
>
> — Author Name
```

---

## Categories & Tags

### Categories
Use for broad topics (2-3 per post maximum):

- Web Development
- Backend Development
- Frontend Development
- DevOps
- Mobile Development
- Software Architecture
- Career & Leadership
- Tutorials
- Personal

### Tags
Use for specific technologies and concepts (5-10 per post):

- javascript
- react
- nodejs
- python
- docker
- kubernetes
- aws
- git
- testing
- performance
- security
- api
- database
- microservices

---

## SEO Best Practices

1. **Title**: 
   - Keep under 60 characters
   - Include main keyword
   - Make it compelling

2. **Description**: 
   - 150-160 characters
   - Summarize the content
   - Include call-to-action

3. **URL Slug**: 
   - Use hyphens, not underscores
   - Keep it short and descriptive
   - Include main keyword

4. **Images**: 
   - Use descriptive alt text
   - Optimize file sizes
   - Use WebP format when possible

5. **Content**:
   - Use headings (H2, H3) for structure
   - Write for humans, not search engines
   - Internal links to related posts

---

## Publishing Workflow

### 1. Draft Post
```bash
# Create new post file
touch _posts/2024-11-25-my-new-post.md

# Add front matter and content
# Set published: false for drafts
```

### 2. Local Preview
```bash
# Start local server
bundle exec jekyll serve --drafts

# View at http://localhost:4000
```

### 3. Review
- Check formatting
- Test code examples
- Verify images load
- Check links
- Proofread content

### 4. Publish
```bash
# Set published: true or remove the field
# Commit and push
git add _posts/2024-11-25-my-new-post.md
git commit -m "Add new post: My New Post"
git push origin main
```

### 5. Share
- Share on social media
- Update internal links if referenced elsewhere

---

## Post Ideas

### Technical Tutorials
- "Building a REST API with Node.js and Express"
- "Introduction to React Hooks"
- "Dockerizing Your Application"
- "Git Best Practices for Teams"

### Deep Dives
- "Understanding JavaScript Closures"
- "How HTTPS Works"
- "Database Indexing Explained"
- "The Event Loop in Node.js"

### Career & Personal
- "My Journey into Software Engineering"
- "Lessons Learned from Failed Projects"
- "Work-Life Balance as a Developer"
- "Contributing to Open Source"

### Project Showcases
- "Building gus.today: A Technical Overview"
- "Architecting a Scalable E-commerce Platform"
- "From Idea to Production: A Case Study"

---

## Image Guidelines

### Header Images
- **Dimensions**: 1920x1080px (16:9 ratio)
- **File Size**: <300KB
- **Format**: WebP or JPEG
- **Quality**: 80-85%

### In-Post Images
- **Max Width**: 1200px
- **File Size**: <200KB per image
- **Format**: WebP (with JPEG fallback)
- **Compression**: Use tools like TinyPNG or ImageOptim

### Screenshots
- **Retina**: Use 2x size, then scale down with CSS
- **Annotations**: Add arrows/highlights for clarity
- **Format**: PNG for UI, JPEG for photos

---

## Related Posts

Related posts are automatically generated based on:
1. Shared categories
2. Shared tags
3. Publication date proximity

Configure in `_config.yml`:
```yaml
defaults:
  - scope:
      type: posts
    values:
      show_related: true
```

Maximum 3 related posts shown by default.

---

## RSS/Atom Feeds

Feeds are automatically generated:
- **Atom**: `/atom.xml`
- **RSS 2.0**: `/rss.xml`

Include in navbar footer:
```yaml
footer:
  links:
    - label: "RSS"
      icon: "fa fa-rss"
      url: "/atom.xml"
```

---

## Archive Pages

Pre-configured archive pages:
- **All Posts**: `/archive/` - Grouped by year
- **By Category**: `/categories/` - All categories with post counts
- **By Tag**: `/tags/` - Tag cloud with post counts

---

## Analytics

### Track Performance
With Google Analytics configured, track:
- Page views
- Average time on page
- Bounce rate
- Traffic sources
- Popular posts

### Metrics to Monitor
- Which topics resonate most
- Optimal posting frequency
- Best publishing times
- Reader engagement

---

## Markdown Cheatsheet

For more markdown features, see:
- `/cheatsheets/01-markdown-cheat-sheet` (on your site)
- `/cheatsheets/02-kramdown-cheat-sheet` (Kramdown-specific features)

---

Last Updated: November 25, 2025

