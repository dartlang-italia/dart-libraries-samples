#!/bin/bash

# Removes all pubspec.lock
echo "Deleting all pubspec.lock files..."
find . -name "pubspec.lock" -exec rm {} \;
# Removes all packages
echo "Deleting packages symlinks"
find . -name "packages" -exec rm -rf {} \; 2>/dev/null
echo "Done! :-)"
