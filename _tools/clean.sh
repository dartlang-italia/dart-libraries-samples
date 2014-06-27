#!/bin/bash

# Removes all pubspec.lock
echo "Deleting all pubspec.lock files..."
find . -name "pubspec.lock" -exec rm {} \;
# Finds all symlinks named packages
echo "Deleting all packages symlinks..."
find .  -type l -name "packages" -exec rm {} \;
# Finds all empty directories named "packages" and removes them
find .  -type d -name "packages" -empty -print | while read PACKAGES_DIR
do
    echo "Deleting $PACKAGES_DIR..."
    rmdir $PACKAGES_DIR
done
echo "Done! :-)"