# Picture of the Day Setup Guide

## Overview

The homepage displays a different picture every day as the hero image, with the date and location shown in the bottom-right corner. Pictures are stored in a separate private repository and fetched daily via GitHub Actions.

## How It Works

1. **Picture Rotation**: The system calculates which picture to show based on the number of days since the `start_date` (set in `_data/pictures.yml`)
2. **Daily Fetch**: A GitHub Action runs daily at midnight UTC to fetch the current picture from your private repo
3. **Metadata Display**: Date and location are stored in `_data/pictures.yml` and displayed as an overlay

## Setup Instructions

### 1. Create Private Pictures Repository

1. Create a new **private** repository on GitHub (e.g., `potd-images`)
2. Add your pictures named sequentially: `1.avif`, `2.avif`, `3.avif`, etc.
3. Recommended image specs:
   - Format: AVIF (best compression) or WebP
   - Dimensions: 1920x1080 or higher
   - File size: Keep under 500KB for fast loading

### 2. Configure Repository Access

1. Go to your GitHub account → **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)**
2. Click **Generate new token** (classic)
3. Name it "POTD Repo Access"
4. Select scopes:
   - ✅ `repo` (Full control of private repositories)
5. Generate token and **copy it** (you won't see it again)
6. Go to your main website repo → **Settings** → **Secrets and variables** → **Actions**
7. Click **New repository secret**
   - Name: `POTD_REPO_TOKEN`
   - Value: Paste the token you just created
8. Click **Add secret**

### 3. Update Configuration

Edit `.github/workflows/fetch-potd.yml`:

```yaml
repository: Ghostavio/potd-images # Change to your private repo name
```

Edit `_data/pictures.yml`:

```yaml
start_date: "2024-11-26" # Set your desired start date

pictures:
  1:
    date: "November 2024"
    location: "São Paulo, Brazil"
  2:
    date: "December 2024"
    location: "Rio de Janeiro, Brazil"
  # Add entries for each picture
```

### 4. Test the Setup

**Manual Test:**

```bash
# Trigger the workflow manually
# Go to: Actions → Fetch Picture of the Day → Run workflow
```

**Local Development:**
For local testing, place a test image at:

```
assets/images/potd/current.avif
```

## File Structure

```
gus-today/
├── _data/
│   └── pictures.yml              # Picture metadata (date, location)
├── _includes/
│   └── potd-info.html           # Calculates current picture and displays overlay
├── assets/
│   ├── images/
│   │   └── potd/
│   │       └── current.avif     # Current picture (updated daily by Action)
│   └── css/
│       └── custom.scss          # Overlay styles
└── .github/
    └── workflows/
        └── fetch-potd.yml       # Daily fetch automation

private-repo/ (potd-images)
├── 1.avif
├── 2.avif
├── 3.avif
└── ...
```

## How Picture Rotation Works

The system calculates which picture to show:

```
days_since_start = (current_date - start_date) / 1 day
picture_number = (days_since_start % total_pictures) + 1
```

**Example:**

- Start date: November 26, 2024
- Total pictures: 10
- Day 0 (Nov 26): Shows picture 1
- Day 1 (Nov 27): Shows picture 2
- Day 10 (Dec 6): Shows picture 1 (cycles back)

## Customization

### Change Overlay Position

Edit `assets/css/custom.scss`:

```scss
.potd-overlay {
  position: absolute;
  bottom: 20px; // Change vertical position
  right: 20px; // Change horizontal position (use 'left:' for left side)
}
```

### Change Overlay Style

Modify `.potd-info` in `custom.scss`:

```scss
.potd-info {
  background: rgba(0, 0, 0, 0.7); // Background color/opacity
  backdrop-filter: blur(10px); // Blur effect
  padding: 12px 20px; // Spacing
  border-radius: 8px; // Corner rounding
}
```

### Change Schedule

Edit `.github/workflows/fetch-potd.yml`:

```yaml
schedule:
  - cron: "0 0 * * *" # Daily at midnight UTC
  # Other examples:
  # - cron: '0 12 * * *'  # Daily at noon UTC
  # - cron: '0 0 * * 1'   # Weekly on Mondays
```

## Adding New Pictures

1. **Upload to private repo**:

   ```bash
   # Continue numbering sequentially
   git add 11.avif 12.avif 13.avif
   git commit -m "Add new pictures"
   git push
   ```

2. **Update metadata** in `_data/pictures.yml`:

   ```yaml
   11:
     date: "January 2025"
     location: "Brasília, Brazil"
   12:
     date: "January 2025"
     location: "Florianópolis, Brazil"
   ```

3. The Action will automatically pick up new pictures on the next run

## Troubleshooting

### Picture not updating?

1. Check GitHub Actions tab for errors
2. Verify `POTD_REPO_TOKEN` secret is set correctly
3. Ensure picture file exists in private repo
4. Check that picture metadata exists in `pictures.yml`

### Overlay not showing?

1. Clear browser cache
2. Check browser console for errors
3. Verify `_includes/potd-info.html` is being included on homepage

### Wrong picture showing?

1. Check `start_date` in `_data/pictures.yml`
2. Verify picture number calculation in workflow
3. Check timezone differences (Action runs in UTC)

## Image Optimization Tips

**Convert to AVIF:**

```bash
# Using ffmpeg
ffmpeg -i input.jpg -c:v libaom-av1 -crf 30 output.avif

# Using avif-cli
avif --input input.jpg --output output.avif --quality 75
```

**Optimize size:**

- Resolution: 1920x1080 recommended
- Quality: 75-85 for photos
- Target size: Under 500KB

## Future Enhancements

Ideas for extending this feature:

- [ ] Add a dedicated "Picture of the Day" archive page
- [ ] Display EXIF data (camera, settings)
- [ ] Add a story/caption for each picture
- [ ] Create a gallery view of past pictures
- [ ] Add social sharing buttons
- [ ] Support for multiple image formats (AVIF fallback to WebP/JPG)

---

Last Updated: November 25, 2025
