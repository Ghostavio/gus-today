# Getting Started with gus.today

Welcome! This guide will help you get started with your new personal website.

## 🚀 First Steps

### 1. Install Dependencies

```bash
# Make sure you have Ruby installed
ruby --version  # Should be 2.7 or higher

# Install bundler if you haven't
gem install bundler

# Install project dependencies
bundle install
```

### 2. Run Locally

```bash
# Start the Jekyll server
bundle exec jekyll serve

# Open your browser to http://localhost:4000
```

The site will automatically reload when you make changes to files.

## 📝 Next Steps

### Add Your Career Timeline

1. Navigate to the `_timeline/` directory
2. You'll find an example file: `example-project.md`
3. Create new timeline entries using this template:

```bash
# Create a new timeline entry
cp _timeline/example-project.md _timeline/2024-your-project.md

# Edit the file with your project details
```

**What to include:**

- Company name
- Project name and description
- Year
- Technologies used
- Project website link
- Thumbnail image (place in `assets/images/timeline/`)

See [`TIMELINE.md`](TIMELINE.md) for detailed instructions.

### Write Your First Blog Post

1. Navigate to the `_posts/` directory
2. Create a new file with format: `YYYY-MM-DD-title.md`

```bash
# Example
touch _posts/2024-11-26-my-first-post.md
```

3. Add front matter and content:

```yaml
---
layout: post
title: "My First Blog Post"
categories: [Web Development]
tags: [tutorial, jekyll]
---
Your content here...
```

See [`BLOG.md`](BLOG.md) for detailed instructions and templates.

### Add Your Projects

For each significant project in your career:

1. Create a timeline entry in `_timeline/`
2. Add a project thumbnail to `assets/images/timeline/`
3. Include:
   - Project overview
   - Your role and responsibilities
   - Technologies used
   - Key achievements
   - Impact metrics

### Customize Your Bio

Edit the homepage (`index.md`) to personalize your introduction.

## 🎨 Customize Appearance

### Theme Colors

The site uses the **Sunset** theme (dark with red accents). To change:

Edit `_config.yml`:

```yaml
chulapa-skin:
  skin: sunset # Change to another skin name
```

Available skins: https://dieghernan.github.io/chulapa/skins

### Custom Styles

Add your own CSS to `assets/css/custom.scss`:

```scss
// Your custom styles here
.my-custom-class {
  color: red;
}
```

### Custom JavaScript

Add custom scripts to `assets/js/` and include them in your layouts.

## 📊 Setup Analytics

To enable Google Analytics:

1. Create a Google Analytics account
2. Get your tracking ID (starts with `G-`)
3. Add it to `_config.yml`:

```yaml
gtag_id: "G-XXXXXXXXXX"
```

## 🌐 Deploy to Production

### GitHub Pages Setup

Your site is configured to deploy automatically via GitHub Actions.

**To enable:**

1. Go to your repository settings
2. Navigate to **Pages**
3. Source should be set to "GitHub Actions"
4. Your site will be available at `https://gus.today`

### Custom Domain Configuration

1. The `CNAME` file already contains `gus.today`
2. Configure DNS at your domain registrar:

**A Records:**

```
Host: @
Points to:
  185.199.108.153
  185.199.109.153
  185.199.110.153
  185.199.111.153
```

**CNAME Record:**

```
Host: www
Points to: ghostavio.github.io
```

3. Wait for DNS propagation (can take 24-48 hours)
4. Enable HTTPS in GitHub Pages settings

See [`SETUP.md`](SETUP.md) for more details.

## 🎞️ Timeline Animations

### CSS-Only Animations

The timeline uses pure CSS and GSAP ScrollTrigger for smooth, performant animations:

- **Vertical line**: Pure CSS gradient line connecting timeline items
- **Card animations**: Items fade and slide in as you scroll
- **Marker animations**: Timeline dots scale in with a bounce effect
- **Responsive**: Optimized for all screen sizes

No external animation libraries needed - it's all built with CSS and GSAP!

## 📱 Test Responsive Design

Make sure to test your site on different devices:

```bash
# Run local server
bundle exec jekyll serve

# Access from mobile device on same network
# Use your computer's IP address:
http://192.168.1.x:4000
```

## 🔍 SEO Optimization

Your site is pre-configured with:

- Sitemap generation
- RSS/Atom feeds
- Meta tags for social sharing
- Open Graph images

**To improve SEO:**

1. Write descriptive meta descriptions for posts
2. Use relevant keywords in titles
3. Add alt text to images
4. Internal linking between posts
5. Submit sitemap to Google Search Console

## 📚 Documentation Reference

- **[SETUP.md](SETUP.md)** - Complete setup and configuration guide
- **[TIMELINE.md](TIMELINE.md)** - Timeline feature documentation
- **[BLOG.md](BLOG.md)** - Blogging guide and best practices
- **[DEVELOPMENT.md](DEVELOPMENT.md)** - Development workflow and commands

## 🆘 Common Issues

### Site not building?

```bash
# Clean and rebuild
bundle exec jekyll clean
bundle exec jekyll build --verbose
```

### Changes not showing?

- Hard refresh browser (Cmd/Ctrl + Shift + R)
- Check console for errors
- Restart Jekyll server

### Styling issues?

- Check `assets/css/custom.scss` syntax
- Verify Bootstrap classes
- Clear browser cache

## 💡 Tips

1. **Start small**: Add one or two timeline entries and blog posts first
2. **Write regularly**: Consistency matters more than frequency
3. **Optimize images**: Keep file sizes under 200KB
4. **Use version control**: Commit often with clear messages
5. **Test locally**: Always preview changes before pushing

## 🎯 Recommended Order

1. ✅ Run site locally
2. ✅ Update personal information (already done in `_config.yml`)
3. 📝 Write your first blog post
4. 🎨 Add 2-3 timeline entries
5. 📸 Add project images
6. 🚀 Deploy to production
7. 🎭 Add Lottie animation (optional)
8. 📊 Set up analytics
9. 🌐 Configure custom domain
10. 📱 Share on social media!

## 🎉 You're Ready!

Your site is fully configured and ready for content. The documentation files will guide you through each feature.

**Questions?** Refer to the detailed documentation in:

- `SETUP.md`
- `TIMELINE.md`
- `BLOG.md`
- `DEVELOPMENT.md`

Happy coding! 🚀

---

Last Updated: November 25, 2025
