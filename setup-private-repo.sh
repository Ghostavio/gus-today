#!/bin/bash
# Setup script for Picture of the Day private repository

echo "🖼️  Picture of the Day - Private Repository Setup"
echo "=================================================="
echo ""
echo "This script will help you set up the private repository for your pictures."
echo ""

# Get repository name
read -p "Enter your private repository name (e.g., potd-images): " REPO_NAME

if [ -z "$REPO_NAME" ]; then
    REPO_NAME="potd-images"
    echo "Using default: $REPO_NAME"
fi

# Create directory
mkdir -p "../$REPO_NAME"
cd "../$REPO_NAME" || exit

# Initialize git repo
git init
echo "✅ Initialized git repository"

# Create README
cat > README.md << EOF
# Picture of the Day Images

This private repository contains images for the Picture of the Day feature on gus.today.

## Structure

Images are named sequentially: \`1.avif\`, \`2.avif\`, \`3.avif\`, etc.

## Adding Pictures

1. Export your photos to AVIF format (recommended) or WebP
2. Name them sequentially (continue from the last number)
3. Commit and push to this repo

## Image Specifications

- **Format**: AVIF (preferred), WebP, or JPG
- **Dimensions**: 1920x1080 or higher
- **File size**: Keep under 500KB for fast loading
- **Quality**: 75-85 for photos

## Converting to AVIF

\`\`\`bash
# Using ffmpeg
ffmpeg -i input.jpg -c:v libaom-av1 -crf 30 output.avif

# Batch convert all JPG files
for img in *.jpg; do
    ffmpeg -i "\$img" -c:v libaom-av1 -crf 30 "\${img%.jpg}.avif"
done
\`\`\`

## Privacy

This repository should remain **PRIVATE** to keep your pictures secure until they're published on the website.
EOF

echo "✅ Created README.md"

# Create .gitignore
cat > .gitignore << EOF
.DS_Store
Thumbs.db
*.tmp
EOF

echo "✅ Created .gitignore"

# Create example structure
mkdir -p examples
cat > examples/NAMING.txt << EOF
Picture Naming Convention
========================

1.avif  <- First picture
2.avif  <- Second picture
3.avif  <- Third picture
...and so on

The system will cycle through these pictures daily starting from the date configured in _data/pictures.yml
EOF

echo "✅ Created example structure"

# Initial commit
git add .
git commit -m "Initial commit - Setup Picture of the Day repository"

echo ""
echo "✅ Repository setup complete!"
echo ""
echo "Next steps:"
echo "1. Create a new PRIVATE repository on GitHub named '$REPO_NAME'"
echo "2. Add your pictures (1.avif, 2.avif, etc.) to this directory"
echo "3. Run these commands:"
echo ""
echo "   git remote add origin https://github.com/Ghostavio/$REPO_NAME.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "4. Generate a Personal Access Token on GitHub:"
echo "   → Settings → Developer settings → Personal access tokens → Generate new token"
echo "   → Select 'repo' scope"
echo "   → Copy the token"
echo ""
echo "5. Add the token as a secret to your main website repository:"
echo "   → Repository Settings → Secrets → Actions → New repository secret"
echo "   → Name: POTD_REPO_TOKEN"
echo "   → Value: [paste your token]"
echo ""
echo "6. Update .github/workflows/fetch-potd.yml with your repository name"
echo ""
echo "📁 Repository location: $(pwd)"

