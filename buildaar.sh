#!/bin/bash

# Configuration
MAVEN_URL="https://central.sonatype.com/publishing"
MAVEN_USERNAME="OCkJ2u"
MAVEN_PASSWORD="D48sRH7fB6DDLyzaUV6eytpVlDYHxmsP0"
VERSION="1.0.4"
GROUP_ID="io.github.myphsar"
ARTIFACT_ID="flutter_release"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Flutter AAR publishing process...${NC}"

# Build Flutter AAR
echo "Building Flutter AAR..."
flutter build aar --no-debug --no-profile --build-number 1.0.4

if [ $? -ne 0 ]; then
    echo -e "${RED}Flutter AAR build failed${NC}"
    exit 1
fi

# The AAR is typically located in:
AAR_PATH="./build/host/outputs/repo/${GROUP_ID//.//}/${ARTIFACT_ID}/${VERSION}/${ARTIFACT_ID}-${VERSION}.aar"

if [ ! -f "$AAR_PATH" ]; then
    # Alternative path for newer Flutter versions
    AAR_PATH="/Users/sak/StudioProjects/myphsar_module/.android/Flutter/build/outputs/aar/flutter-release.aar"
fi

if [ ! -f "$AAR_PATH" ]; then
    echo -e "${RED}AAR file not found at expected location${NC}"
    find . -name "*.aar" -type f
    exit 1
fi

echo "AAR found at: $AAR_PATH"

# Manual upload using curl
echo "Uploading AAR to Maven repository..."

curl -v -u "${MAVEN_USERNAME}:${MAVEN_PASSWORD}" \
    --upload-file "$AAR_PATH" \
    "${MAVEN_URL}${GROUP_ID//.//}/${ARTIFACT_ID}/${VERSION}/${ARTIFACT_ID}-${VERSION}.aar"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Successfully published AAR to Maven repository${NC}"
else
    echo -e "${RED}Failed to publish AAR to Maven repository${NC}"
    exit 1
fi