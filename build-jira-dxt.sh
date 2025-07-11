#!/bin/bash
# Build script for creating MCP Atlassian Jira Desktop Extension (.dxt)

set -e

echo "Building MCP Atlassian Jira Desktop Extension..."

# Get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Version from jira manifest
VERSION=$(jq -r '.version' manifest.jira.json)
EXTENSION_NAME="mcp-atlassian-jira"

# Create temporary build directory
BUILD_DIR="build/jira-dxt"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

echo "Preparing Jira extension files..."

# Copy required files
cp manifest.jira.json "$BUILD_DIR/manifest.json"
cp README.jira.dxt.md "$BUILD_DIR/README.md" 2>/dev/null || echo "README.jira.dxt.md not found, skipping..."
cp pyproject.toml "$BUILD_DIR/pyproject.toml"
cp requirements.txt "$BUILD_DIR/requirements.txt"
cp LICENSE "$BUILD_DIR/" 2>/dev/null || echo "No LICENSE file found"

# Copy Python source code - preserve full structure
cp -r src "$BUILD_DIR/"

# Copy dependencies if using a lib directory
if [ -d "lib" ]; then
    echo "Copying lib directory..."
    cp -r lib "$BUILD_DIR/lib"
fi

# Create requirements file for documentation
if [ -f "pyproject.toml" ]; then
    echo "Including pyproject.toml for dependency reference..."
    cp pyproject.toml "$BUILD_DIR/"
fi

# Create the .dxt file (zip archive)
echo "Creating ${EXTENSION_NAME}-${VERSION}.dxt..."
cd "$BUILD_DIR"
# Install Python dependencies
pip install -r requirements.txt --target src/lib --upgrade --force-reinstall
# Pack the extension
npx @anthropic-ai/dxt pack 
cp *.dxt "../${EXTENSION_NAME}-${VERSION}.dxt"
cd ../..

# Clean up
rm -rf "$BUILD_DIR"

echo "✅ Jira Desktop Extension built successfully: ${EXTENSION_NAME}-${VERSION}.dxt"
echo ""
echo "To install:"
echo "1. Open Claude Desktop"
echo "2. Go to Settings > Extensions"
echo "3. Click 'Install Extension' and select ${EXTENSION_NAME}-${VERSION}.dxt"
echo "4. Configure your Jira credentials in the extension settings"