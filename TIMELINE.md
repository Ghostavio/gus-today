# Timeline Feature - Implementation Guide

## Overview

The Timeline section showcases career highlights with scroll-triggered animations. A CSS vertical line connects different years, companies, and projects, with cards animating into view as you scroll.

---

## Directory Structure

```
_timeline/                    # Collection directory
├── 2018-project-one.md      # Example timeline entry
├── 2020-project-two.md
└── 2023-project-three.md

assets/
├── images/
│   └── timeline/            # Project thumbnails
│       ├── project-one.jpg
│       └── project-two.jpg
├── js/
│   └── timeline.js          # Animation logic (GSAP ScrollTrigger)
└── css/
    └── custom.scss          # Timeline styles including CSS line

_layouts/
├── timeline.html            # Timeline page layout
└── timeline-item.html       # Single item layout (optional)
```

---

## Timeline Entry Template

Create files in `_timeline/` directory with this format:

```yaml
---
layout: timeline-item
title: "Project or Role Name"
company: "Company Name"
year: "2023"
date: 2023-06-15           # For ordering (YYYY-MM-DD)
technologies:
  - "React"
  - "Node.js"
  - "AWS"
  - "Docker"
website: "https://project-website.com"
thumbnail: "/assets/images/timeline/project-thumbnail.jpg"
order: 5                    # Lower numbers appear first (chronological)
published: true
---

## Project Description

Brief description of the project and your role.

### Key Achievements
- Achievement 1
- Achievement 2
- Achievement 3

### Technical Highlights
Technical details about the implementation, challenges solved, etc.
```

---

## Timeline Page Layout

Create `_layouts/timeline.html`:

```html
---
layout: default
---

<div class="timeline-container">
  <!-- Timeline Content -->
  <div class="timeline-content">
    {% assign sorted_timeline = site.timeline | sort: 'order' %} {% for item in
    sorted_timeline %}
    <div class="timeline-item" data-year="{{ item.year }}">
      <div class="timeline-marker"></div>

      <div class="timeline-card">
        {% if item.thumbnail %}
        <div class="timeline-thumbnail">
          <img
            src="{{ item.thumbnail | relative_url }}"
            alt="{{ item.title }}"
          />
        </div>
        {% endif %}

        <div class="timeline-details">
          <span class="timeline-year">{{ item.year }}</span>
          <h3 class="timeline-title">{{ item.title }}</h3>
          <p class="timeline-company">{{ item.company }}</p>

          <div class="timeline-technologies">
            {% for tech in item.technologies %}
            <span class="tech-badge">{{ tech }}</span>
            {% endfor %}
          </div>

          <div class="timeline-description">{{ item.content }}</div>

          {% if item.website %}
          <a href="{{ item.website }}" class="btn btn-primary" target="_blank">
            <i class="fas fa-external-link-alt"></i> Visit Project
          </a>
          {% endif %}
        </div>
      </div>
    </div>
    {% endfor %}
  </div>
</div>

<!-- Load Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
<script src="{{ '/assets/js/timeline.js' | relative_url }}"></script>
```

---

## Animation JavaScript

Create `assets/js/timeline.js`:

```javascript
document.addEventListener("DOMContentLoaded", function () {
  // Register GSAP ScrollTrigger
  if (typeof gsap !== "undefined" && typeof ScrollTrigger !== "undefined") {
    gsap.registerPlugin(ScrollTrigger);

    // Animate timeline cards on scroll
    gsap.utils.toArray(".timeline-item").forEach((item) => {
      gsap.from(item, {
        scrollTrigger: {
          trigger: item,
          start: "top 85%",
          end: "top 60%",
          scrub: 1,
        },
        opacity: 0,
        x: -50,
        duration: 0.8,
      });

      // Animate markers
      const marker = item.querySelector(".timeline-marker");
      if (marker) {
        gsap.from(marker, {
          scrollTrigger: {
            trigger: item,
            start: "top 80%",
          },
          scale: 0,
          duration: 0.4,
          ease: "back.out(1.7)",
        });
      }
    });
  }
});
```

---

## Custom Styles

Add to `assets/css/custom.scss`:

```scss
// Timeline Container
.timeline-container {
  position: relative;
  max-width: 1200px;
  margin: 0 auto;
  padding: 60px 20px;
}

// CSS vertical line (already included in timeline-content::before)
}

// Timeline Content
.timeline-content {
  position: relative;
  z-index: 1;
}

// Timeline Item
.timeline-item {
  position: relative;
  margin-bottom: 80px;
  padding-left: 60px;

  &:last-child {
    margin-bottom: 0;
  }
}

// Timeline Marker (Dot)
.timeline-marker {
  position: absolute;
  left: 0;
  top: 20px;
  width: 24px;
  height: 24px;
  border-radius: 50%;
  background: var(--chulapa-primary, #dc3545);
  border: 4px solid var(--chulapa-bg, #fff);
  box-shadow: 0 0 0 4px rgba(220, 53, 69, 0.2);
  z-index: 2;
}

// Timeline Card
.timeline-card {
  background: var(--chulapa-bg-alt, #f8f9fa);
  border-radius: 12px;
  padding: 30px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;

  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
  }
}

// Timeline Thumbnail
.timeline-thumbnail {
  margin-bottom: 20px;
  border-radius: 8px;
  overflow: hidden;

  img {
    width: 100%;
    height: auto;
    display: block;
  }
}

// Timeline Year
.timeline-year {
  display: inline-block;
  font-size: 0.875rem;
  font-weight: 700;
  color: var(--chulapa-primary, #dc3545);
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-bottom: 8px;
}

// Timeline Title
.timeline-title {
  font-size: 1.75rem;
  font-weight: 700;
  margin-bottom: 8px;
  color: var(--chulapa-text, #212529);
}

// Timeline Company
.timeline-company {
  font-size: 1.125rem;
  color: var(--chulapa-text-muted, #6c757d);
  margin-bottom: 16px;
  font-weight: 500;
}

// Technologies
.timeline-technologies {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 20px;
}

.tech-badge {
  display: inline-block;
  padding: 6px 12px;
  background: var(--chulapa-primary, #dc3545);
  color: #fff;
  border-radius: 20px;
  font-size: 0.875rem;
  font-weight: 500;
}

// Timeline Description
.timeline-description {
  margin-bottom: 20px;
  line-height: 1.6;
  color: var(--chulapa-text, #212529);
}

// Responsive Design
@media (max-width: 768px) {
  .timeline-item {
    padding-left: 40px;
  }

  .timeline-marker {
    width: 16px;
    height: 16px;
  }

  .timeline-card {
    padding: 20px;
  }

  .timeline-title {
    font-size: 1.5rem;
  }
}
```

---

## Timeline Animations

### CSS Vertical Line

The timeline uses a pure CSS vertical line that connects all timeline items. The line is created using a `:before` pseudo-element:

```scss
.timeline-content::before {
  content: "";
  position: absolute;
  left: 12px;
  top: 0;
  bottom: 0;
  width: 2px;
  background: linear-gradient(
    to bottom,
    transparent 0%,
    var(--chulapa-primary, #dc3545) 5%,
    var(--chulapa-primary, #dc3545) 95%,
    transparent 100%
  );
  opacity: 0.5;
}
```

This creates a gradient line that:

- Fades in at the top
- Runs down the entire timeline
- Fades out at the bottom
- Uses your theme's primary color

---

## Timeline Page

Create `_pages/timeline.md`:

```yaml
---
layout: timeline
title: Career Timeline
subtitle: A journey through projects and experiences
header_type: hero
permalink: /timeline/
include_on_search: true
---
```

---

## Adding to Navigation

Update `_config.yml` navbar section:

```yaml
navbar:
  nav:
    - title: Home
      url: /
    - title: Timeline
      url: /timeline/
    - title: Blog
      url: /blog/
```

---

## Example Timeline Entry

`_timeline/2023-awesome-project.md`:

```yaml
---
layout: timeline-item
title: "E-commerce Platform Rebuild"
company: "TechCorp Inc."
year: "2023"
date: 2023-03-15
technologies:
  - "React"
  - "Node.js"
  - "PostgreSQL"
  - "AWS"
  - "Docker"
website: "https://example.com"
thumbnail: "/assets/images/timeline/techcorp-ecommerce.jpg"
order: 10
published: true
---

## Project Overview

Led the complete rebuild of a legacy e-commerce platform serving 100k+ daily users.

### Key Achievements
- Reduced page load time by 60%
- Increased conversion rate by 25%
- Implemented microservices architecture
- Established CI/CD pipeline with 99.9% uptime

### Technical Highlights
Migrated from monolithic PHP application to modern React/Node.js stack with microservices architecture. Implemented real-time inventory management, automated deployment pipelines, and comprehensive monitoring solutions.
```

---

## Testing

1. **Local Testing**

   ```bash
   bundle exec jekyll serve
   # Visit http://localhost:4000/timeline/
   ```

2. **Check Collection**

   ```bash
   # Verify timeline files are recognized
   bundle exec jekyll build --verbose
   ```

3. **Debug**
   - Check browser console for JavaScript errors
   - Check browser console for JavaScript errors
   - Test scroll animations
   - Verify responsive design on mobile

---

## Performance Tips

1. **Optimize Images**

   - Compress thumbnails (recommended: 800x600px, <200KB)
   - Use WebP format for better compression
   - Add lazy loading: `loading="lazy"`

2. **Lazy Load Scripts**

   - Only load animation libraries on timeline page
   - Use async/defer attributes

3. **Caching**
   - Enable browser caching in GitHub Pages
   - Use CDN for external libraries

---

Last Updated: November 25, 2025
