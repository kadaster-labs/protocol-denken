#!/bin/bash

# Lokaal build script voor multi-language site
echo "🔨 Building multi-language MkDocs site locally..."

# Clean old builds
echo "🧹 Cleaning old builds..."
sudo rm -rf site site_combined

# Build Dutch version using Docker
echo "🇳🇱 Building Dutch version..."
docker run --rm -v ${PWD}:/docs --entrypoint="" squidfunk/mkdocs-material:latest sh -c "pip install -r requirements.txt && mkdocs build -f mkdocs.nl.yml" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "❌ Dutch build failed"
    exit 1
fi

# Build English version using Docker
echo "🇺🇸 Building English version..."
docker run --rm -v ${PWD}:/docs --entrypoint="" squidfunk/mkdocs-material:latest sh -c "pip install -r requirements.txt && mkdocs build -f mkdocs.en.yml" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "❌ English build failed"
    exit 1
fi

# Create combined site structure
echo "🔗 Creating combined site structure..."
mkdir -p site_combined
cp -r site/nl site_combined/
cp -r site/en site_combined/
cp index.html site_combined/

echo "✅ Build complete!"
echo "📂 Site structure:"
echo "   site_combined/"
echo "   ├── index.html      (language selector)"
echo "   ├── nl/             (Dutch site)"
echo "   └── en/             (English site)"
echo ""
echo "🌐 To test locally, serve site_combined/ folder:"
echo "   cd site_combined && python -m http.server 8000"
echo "   Then visit: http://localhost:8000"