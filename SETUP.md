# gus.today - Personal Website Setup

## Project Overview

Personal website for Gustavo Siqueira (Software Engineer) built with Chulapa Jekyll Theme.

**Live Site**: https://gus.today  
**Repository**: https://github.com/Ghostavio/gus-today
**Theme**: Chulapa by dieghernan  
**Theme Docs**: https://dieghernan.github.io/chulapa/docs

---

## Personal Information

- **Name**: Gustavo Siqueira
- **Location**: Brazil
- **Timezone**: America/Sao_Paulo (GMT-3)
- **Email**: gustavo.anacleto@gmail.com
- **GitHub**: [Ghostavio](https://github.com/Ghostavio)
- **LinkedIn**: [codenamegus](https://www.linkedin.com/in/codenamegus/)
- **Instagram**: [@Ghostavio](https://instagram.com/Ghostavio)

---

## Site Structure

### Main Sections

1. **Home Page** (`index.md`)

   - Hero landing page
   - Introduction and bio
   - Quick navigation to other sections

2. **Timeline** (`_timeline` collection)

   - Interactive scrolling timeline with Lottie animations
   - Career highlights in chronological order
   - Each entry includes:
     - Company name
     - Project name & thumbnail
     - Year
     - Technologies used
     - Website link
     - Description

3. **Blog** (`_posts` directory)

   - Technical articles and thoughts
   - Categorized and tagged posts
   - Paginated blog index at `/blog/`

4. **Picture of the Day** (Future implementation)
   - Deferred until main site is complete

---

## Design & Theme

### Color Scheme

- **Primary Theme**: Sunset skin (elegant dark theme with red accents)
- **Theme Source**: https://dieghernan.github.io/chulapa/skins
- **Available Skins**: 41 predefined skins from Bootswatch, Tophat, and custom designs

### Configuration

Set in `_config.yml`:

```yaml
chulapa-skin:
  skin: sunset
```

---

## Jekyll Collections

### Timeline Collection

Located in `_timeline/` directory.

**Front Matter Template**:

```yaml
---
layout: timeline-item
title: "Project Name"
company: "Company Name"
year: "2023"
technologies:
  - "Technology 1"
  - "Technology 2"
  - "Technology 3"
website: "https://project-url.com"
thumbnail: "/assets/images/timeline/project-thumbnail.jpg"
order: 1
---
Project description and your role/achievements.
```

**Display Order**: Chronological (oldest to newest, controlled by `order` field)

---

## Technical Features

### Timeline Animation

- **Scroll Library**: GSAP ScrollTrigger
- **Animation Style**: Pure CSS vertical line with scroll-triggered card animations
- **Implementation**: Custom JavaScript in `assets/js/timeline.js` + CSS in `custom.scss`

### Analytics

- **Platform**: Google Analytics
- **Configuration**: Set `gtag_id` in `_config.yml`

### Search

- **Engine**: Fuse.js (default in template)
- **Provider**: `fusejs`

### Comments

- **Status**: Disabled (not needed)

---

## Domain Configuration

### GitHub Pages Setup

1. Add CNAME file with `gus.today`
2. Configure DNS:
   - A records pointing to GitHub Pages IPs:
     - 185.199.108.153
     - 185.199.109.153
     - 185.199.110.153
     - 185.199.111.153
   - CNAME record: `www` → `ghostavio.github.io`

### \_config.yml Settings

```yaml
url: "https://gus.today"
baseurl: ""
repository: "Ghostavio/gus-today"
```

---

## Development Workflow

### Local Development

```bash
# Install dependencies
bundle install

# Run local server
bundle exec jekyll serve

# View site at http://localhost:4000
```

### Content Creation

#### New Blog Post

```bash
# Create file: _posts/YYYY-MM-DD-title.md
---
layout: post
title: "Your Post Title"
subtitle: "Optional subtitle"
categories: [Category1, Category2]
tags: [tag1, tag2, tag3]
header_type: "hero"
---

Your content here...
```

#### New Timeline Entry

```bash
# Create file: _timeline/YYYY-project-name.md
# Use template from collections section above
```

---

## File Structure

```
gus-today/
├── _config.yml              # Main configuration
├── _timeline/               # Timeline collection
├── _posts/                  # Blog posts
├── _pages/                  # Static pages
├── _includes/
│   └── custom/              # Custom HTML includes
├── assets/
│   ├── css/
│   │   └── custom.scss      # Custom styles
│   ├── js/
│   │   └── timeline.js      # Timeline animations
│   └── images/
│       └── timeline/        # Timeline thumbnails
├── blog/
│   └── index.html           # Blog index with pagination
├── index.md                 # Home page
└── CNAME                    # Domain configuration
```

---

## Deployment

### GitHub Actions

GitHub Actions workflow is included in `.github/workflows/` for automatic deployment on push to main branch.

### Manual Deployment

1. Commit changes: `git add . && git commit -m "Update content"`
2. Push to GitHub: `git push origin main`
3. GitHub Pages will automatically build and deploy

---

## Resources

- **Chulapa Documentation**: https://dieghernan.github.io/chulapa/docs
- **Jekyll Documentation**: https://jekyllrb.com/docs/
- **Markdown Guide**: https://www.markdownguide.org/
- **Lottie Files**: https://lottiefiles.com/
- **GSAP ScrollTrigger**: https://greensock.com/scrolltrigger/
- **Bootstrap 4.5 Docs**: https://getbootstrap.com/docs/4.5/

---

## Notes

- Template comes with sample content in `_posts/` and `_cheatsheet/` - remove when ready
- Theme uses Bootstrap 4.5 for styling
- FontAwesome 6 icons available
- Responsive design included
- SEO optimized with meta tags
- RSS/Atom feeds auto-generated
- Sitemap auto-generated

---

Last Updated: November 25, 2025
