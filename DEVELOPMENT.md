# Development Guide - gus.today

## Quick Start

```bash
# Clone repository
git clone https://github.com/Ghostavio/gus-today.git
cd gus-today

# Install dependencies
bundle install

# Run local server
bundle exec jekyll serve

# View site at http://localhost:4000
```

---

## Prerequisites

### Required Software

1. **Ruby** (version 2.7 or higher)
   ```bash
   # Check version
   ruby --version
   
   # Install with rbenv (recommended)
   rbenv install 3.2.0
   rbenv global 3.2.0
   ```

2. **Bundler**
   ```bash
   gem install bundler
   ```

3. **Jekyll**
   ```bash
   gem install jekyll
   ```

4. **Git**
   ```bash
   # Check version
   git --version
   ```

### Optional Tools

- **Node.js & npm**: For additional build tools
- **ImageMagick**: For image processing
- **VS Code**: Recommended editor with extensions:
  - Jekyll Snippets
  - Markdown All in One
  - YAML
  - Liquid

---

## Project Structure

```
gus-today/
│
├── _config.yml                 # Main Jekyll configuration
├── _config_dev.yml             # Development overrides (optional)
├── Gemfile                     # Ruby dependencies
├── Gemfile.lock                # Locked dependency versions
│
├── _data/                      # Data files (YAML, JSON, CSV)
│   └── navigation.yml          # Navigation structure (if needed)
│
├── _includes/                  # Reusable HTML components
│   ├── head.html
│   ├── header.html
│   ├── footer.html
│   └── custom/                 # Custom includes
│       ├── custom_head.html
│       ├── custom_bottomscripts.html
│       └── timeline-scripts.html
│
├── _layouts/                   # Page layouts
│   ├── default.html
│   ├── post.html
│   ├── page.html
│   ├── timeline.html           # Custom timeline layout
│   └── timeline-item.html
│
├── _posts/                     # Blog posts
│   └── YYYY-MM-DD-title.md
│
├── _timeline/                  # Timeline collection
│   └── YYYY-project-name.md
│
├── _pages/                     # Static pages
│   ├── 404.md
│   ├── about.md
│   ├── archive.md
│   ├── categories.md
│   ├── tags.md
│   └── search.md
│
├── _drafts/                    # Unpublished posts
│   └── draft-post.md
│
├── _site/                      # Generated site (ignored by git)
│
├── assets/                     # Static assets
│   ├── css/
│   │   └── custom.scss         # Custom styles
│   ├── js/
│   │   └── timeline.js         # Custom JavaScript
│   ├── images/
│   │   ├── avatar.jpg
│   │   ├── timeline/
│   │   └── posts/
│   └── lottie/
│       └── line-draw.json
│
├── blog/
│   └── index.html              # Blog index with pagination
│
├── index.md                    # Homepage
├── CNAME                       # Custom domain configuration
│
└── .github/
    └── workflows/
        └── jekyll.yml          # GitHub Actions deployment
```

---

## Configuration Files

### _config.yml
Main site configuration. Changes require server restart.

```yaml
# Development vs Production
url: "https://gus.today"        # Production URL
# url: "http://localhost:4000"  # Uncomment for local dev

# Timezone
timezone: America/Sao_Paulo

# Collections
collections:
  timeline:
    output: true
    permalink: /timeline/:name/
```

### _config_dev.yml (Optional)
Override settings for local development:

```yaml
# Development Configuration
url: "http://localhost:4000"
baseurl: ""

# Faster builds
incremental: true
profile: true

# Show drafts
show_drafts: true
future: true
unpublished: true
```

Run with: `bundle exec jekyll serve --config _config.yml,_config_dev.yml`

---

## Common Commands

### Build & Serve

```bash
# Standard serve (development)
bundle exec jekyll serve

# With drafts
bundle exec jekyll serve --drafts

# With future posts
bundle exec jekyll serve --future

# With unpublished posts
bundle exec jekyll serve --unpublished

# Incremental build (faster)
bundle exec jekyll serve --incremental

# Live reload
bundle exec jekyll serve --livereload

# Specific port
bundle exec jekyll serve --port 4001

# Detailed output
bundle exec jekyll serve --verbose

# Production build
JEKYLL_ENV=production bundle exec jekyll build
```

### Clean

```bash
# Remove generated site
bundle exec jekyll clean

# Clean and build
bundle exec jekyll clean && bundle exec jekyll build
```

### Update Dependencies

```bash
# Update gems
bundle update

# Update specific gem
bundle update jekyll

# Check outdated gems
bundle outdated
```

---

## Development Workflow

### 1. Feature Branch

```bash
# Create feature branch
git checkout -b feature/timeline-animation

# Make changes...

# Commit
git add .
git commit -m "Add timeline scroll animation"

# Push
git push origin feature/timeline-animation
```

### 2. Testing Locally

```bash
# Start server
bundle exec jekyll serve --livereload

# Test in browsers:
# - Chrome: http://localhost:4000
# - Firefox: http://localhost:4000
# - Safari: http://localhost:4000
# - Mobile (use local IP): http://192.168.1.x:4000
```

### 3. Merge to Main

```bash
# Switch to main
git checkout main

# Merge feature
git merge feature/timeline-animation

# Push to GitHub
git push origin main

# GitHub Actions will automatically deploy
```

---

## Environment Variables

### Local Development

Create `.env` file (git-ignored):

```bash
# Google Analytics
GOOGLE_ANALYTICS_ID=G-XXXXXXXXXX

# Algolia Search (if using)
ALGOLIA_APP_ID=your_app_id
ALGOLIA_INDEX_NAME=your_index
ALGOLIA_API_KEY=your_api_key
```

Access in `_config.yml`:
```yaml
gtag_id: <%= ENV['GOOGLE_ANALYTICS_ID'] %>
```

---

## Debugging

### Jekyll Build Issues

```bash
# Verbose output
bundle exec jekyll build --verbose

# Profile build performance
bundle exec jekyll build --profile

# Check configuration
bundle exec jekyll doctor

# Trace errors
bundle exec jekyll build --trace
```

### Common Issues

1. **"Liquid Exception"**
   - Check syntax in `.md` files
   - Verify front matter YAML is valid
   - Look for unescaped special characters

2. **"Page build warning"**
   - Check `_config.yml` syntax
   - Verify file names follow conventions
   - Check for duplicate permalinks

3. **"Dependency Error"**
   - Run `bundle update`
   - Check Ruby version compatibility
   - Clear cache: `bundle exec jekyll clean`

4. **Styling Issues**
   - Clear browser cache
   - Check CSS compilation
   - Verify custom.scss syntax

5. **Missing Collections**
   - Ensure collection folder starts with `_`
   - Verify collection config in `_config.yml`
   - Check file front matter

---

## Testing

### Manual Testing Checklist

- [ ] Homepage loads correctly
- [ ] Blog index shows posts
- [ ] Individual blog posts render properly
- [ ] Timeline page displays all entries
- [ ] Timeline animation works on scroll
- [ ] Search functionality works
- [ ] Mobile responsive on all pages
- [ ] Images load correctly
- [ ] Links work (internal and external)
- [ ] 404 page renders
- [ ] RSS feed validates

### Browser Testing

Test on:
- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile Safari (iOS)
- Chrome Mobile (Android)

### Performance Testing

```bash
# Lighthouse (Chrome DevTools)
# Aim for:
# - Performance: >90
# - Accessibility: >95
# - Best Practices: >90
# - SEO: >95
```

### Validation

- **HTML**: https://validator.w3.org/
- **CSS**: https://jigsaw.w3.org/css-validator/
- **RSS**: https://validator.w3.org/feed/
- **Accessibility**: https://wave.webaim.org/

---

## Optimization

### Build Performance

```yaml
# _config.yml
# Faster builds
incremental: true
profile: true

# Exclude unnecessary files
exclude:
  - node_modules
  - vendor
  - Gemfile
  - Gemfile.lock
  - README.md
  - SETUP.md
  - TIMELINE.md
  - BLOG.md
  - DEVELOPMENT.md
  - .git
  - .github
  - .vscode
```

### Image Optimization

```bash
# Install ImageOptim CLI (macOS)
npm install -g imageoptim-cli

# Optimize images
imageoptim assets/images/**/*.{jpg,png}

# Convert to WebP
# Install cwebp: brew install webp
find assets/images -name "*.jpg" -exec sh -c 'cwebp -q 85 "$1" -o "${1%.jpg}.webp"' _ {} \;
```

### Minification

Already handled by Jekyll in production:

```yaml
# _config.yml
sass:
  style: compressed

compress_html:
  clippings: all
  blanklines: true
```

---

## Deployment

### GitHub Pages (Automatic)

Configured in `.github/workflows/jekyll.yml`:

```yaml
name: Deploy Jekyll site to Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Setup Pages
        uses: actions/configure-pages@v4
      - name: Build with Jekyll
        uses: actions/jekyll-build-pages@v1
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### Manual Deployment

```bash
# Build for production
JEKYLL_ENV=production bundle exec jekyll build

# Site is in _site/ directory
# Upload to your hosting provider
```

---

## Git Workflow

### .gitignore

```
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata
.bundle/
vendor/
.env
.DS_Store
Thumbs.db
*.swp
```

### Commit Messages

Follow conventional commits:

```
feat: Add timeline scroll animation
fix: Correct mobile navigation issue
docs: Update SETUP.md with new instructions
style: Improve timeline card styling
refactor: Reorganize CSS structure
test: Add manual testing checklist
chore: Update dependencies
```

### Branches

- `main`: Production-ready code
- `develop`: Development branch (optional)
- `feature/*`: New features
- `fix/*`: Bug fixes
- `docs/*`: Documentation updates

---

## Custom Domain Setup

### GitHub Pages Configuration

1. **Add CNAME file**
   ```bash
   echo "gus.today" > CNAME
   git add CNAME
   git commit -m "Add custom domain"
   git push
   ```

2. **Configure DNS** (at your domain registrar)
   
   A Records:
   ```
   Type: A
   Name: @
   Value: 185.199.108.153

   Type: A
   Name: @
   Value: 185.199.109.153

   Type: A
   Name: @
   Value: 185.199.110.153

   Type: A
   Name: @
   Value: 185.199.111.153
   ```

   CNAME Record (for www):
   ```
   Type: CNAME
   Name: www
   Value: ghostavio.github.io
   ```

3. **Enable HTTPS** (GitHub Pages Settings)
   - Go to repo Settings > Pages
   - Check "Enforce HTTPS"

### Verify Setup

```bash
# Check DNS propagation
dig gus.today +noall +answer

# Should show GitHub Pages IPs
```

---

## Troubleshooting

### Site Not Building

1. Check GitHub Actions status
2. Review build logs
3. Verify `_config.yml` syntax
4. Check for Liquid errors
5. Ensure all dependencies are listed in `Gemfile`

### Custom Domain Issues

1. Verify CNAME file exists in root
2. Check DNS records propagation (can take 24-48h)
3. Ensure "Enforce HTTPS" is enabled
4. Clear browser cache

### Performance Issues

1. Optimize images
2. Enable caching headers
3. Minimize custom CSS/JS
4. Use CDN for external libraries
5. Check for slow liquid filters

---

## Resources

### Documentation
- [Jekyll Docs](https://jekyllrb.com/docs/)
- [Chulapa Theme Docs](https://dieghernan.github.io/chulapa/docs)
- [Liquid Syntax](https://shopify.github.io/liquid/)
- [Kramdown Syntax](https://kramdown.gettalong.org/syntax.html)
- [GitHub Pages Docs](https://docs.github.com/en/pages)

### Tools
- [Jekyll Compose](https://github.com/jekyll/jekyll-compose) - CLI for creating posts
- [Jekyll Admin](https://github.com/jekyll/jekyll-admin) - Admin interface
- [Prose.io](https://prose.io) - Web-based content editor

### Community
- [Jekyll Talk](https://talk.jekyllrb.com/)
- [Jekyll Discord](https://discord.gg/jekyll)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/jekyll)

---

Last Updated: November 25, 2025

