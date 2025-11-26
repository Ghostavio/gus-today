# gus.today

Personal website and blog of Gustavo Siqueira, Software Engineer from Brazil.

**Live Site**: [https://gus.today](https://gus.today)

## About

This is my personal website built with [Jekyll](https://jekyllrb.com/) and the [Chulapa theme](https://dieghernan.github.io/chulapa/). It features:

- **Career Timeline**: Interactive timeline showcasing my professional journey with scroll-triggered animations
- **Blog**: Technical articles, tutorials, and insights about software engineering
- **Picture of the Day**: Daily rotating hero image on homepage with date and location overlay

## Tech Stack

- **Jekyll** - Static site generator
- **Chulapa** - Beautiful Jekyll theme with Sunset skin
- **GitHub Pages** - Hosting
- **GSAP & ScrollTrigger** - Scroll animations
- **Bootstrap 4.5** - Responsive framework

## Documentation

Comprehensive documentation is available in the following files:

- [`SETUP.md`](SETUP.md) - Complete setup guide with configuration details
- [`TIMELINE.md`](TIMELINE.md) - Timeline feature implementation guide
- [`BLOG.md`](BLOG.md) - Blog content creation guide
- [`PICTURE_OF_THE_DAY.md`](PICTURE_OF_THE_DAY.md) - Picture of the Day setup and configuration
- [`DEVELOPMENT.md`](DEVELOPMENT.md) - Development workflow and commands

## Quick Start

### Prerequisites

- Ruby 2.7 or higher
- Bundler
- Jekyll

### Installation

```bash
# Clone the repository
git clone https://github.com/Ghostavio/gus-today.git
cd gus-today

# Install dependencies
bundle install

# Run local server
bundle exec jekyll serve

# View at http://localhost:4000
```

## Project Structure

```
gus-today/
├── _config.yml           # Main configuration
├── _timeline/            # Timeline collection
├── _posts/               # Blog posts
├── _pages/               # Static pages
├── _layouts/             # Custom layouts
├── assets/
│   ├── css/             # Custom styles
│   ├── js/              # Custom JavaScript
│   ├── images/          # Images
│   └── lottie/          # Animation files
├── blog/                # Blog index
├── index.md             # Homepage
└── CNAME                # Custom domain
```

## Creating Content

### New Blog Post

Create a file in `_posts/` with format `YYYY-MM-DD-title.md`:

```yaml
---
layout: post
title: "Your Post Title"
categories: [Category]
tags: [tag1, tag2]
---
Your content here...
```

See [`BLOG.md`](BLOG.md) for detailed instructions.

### New Timeline Entry

Create a file in `_timeline/` with format `YYYY-project-name.md`:

```yaml
---
layout: timeline-item
title: "Project Name"
company: "Company Name"
year: "2024"
technologies: ["Tech1", "Tech2"]
website: "https://example.com"
thumbnail: "/assets/images/timeline/project.jpg"
order: 1
---
Project description...
```

See [`TIMELINE.md`](TIMELINE.md) for detailed instructions.

## Deployment

The site automatically deploys to GitHub Pages when you push to the `main` branch via GitHub Actions.

### Custom Domain Setup

1. Add your domain to the `CNAME` file
2. Configure DNS records (see [`SETUP.md`](SETUP.md) for details)
3. Enable HTTPS in repository settings

## Resources

- **Chulapa Documentation**: https://dieghernan.github.io/chulapa/docs
- **Jekyll Documentation**: https://jekyllrb.com/docs/
- **Theme Skins**: https://dieghernan.github.io/chulapa/skins

## License

This project uses the [Chulapa theme](https://github.com/dieghernan/chulapa) which is MIT licensed.

Personal content © 2024 Gustavo Siqueira. All rights reserved.

## Connect

- **GitHub**: [@Ghostavio](https://github.com/Ghostavio)
- **LinkedIn**: [codenamegus](https://www.linkedin.com/in/codenamegus/)
- **Instagram**: [@Ghostavio](https://instagram.com/Ghostavio)
- **Email**: gustavo.anacleto@gmail.com

---

Built with ❤️ using Jekyll and Chulapa
