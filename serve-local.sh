#!/bin/bash

# Check if site_combined exists
if [ ! -d "site_combined" ]; then
    echo "❌ site_combined directory not found. Run ./build-local.sh first"
    exit 1
fi

echo "🌐 Starting local server..."
echo "📍 Language selector: http://localhost:8000"
echo "🇳🇱 Dutch site: http://localhost:8000/nl/"  
echo "🇺🇸 English site: http://localhost:8000/en/"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

cd site_combined && python3 -m http.server 8000