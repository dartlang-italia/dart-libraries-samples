#!/bin/bash

if [[ -z "$DART_SDK" ]]; then
    echo "Warrrrning. \$DART_SDK must be set. Quitting."
    exit
fi

find . -name "pubspec.yaml" -exec dirname {} \; | while read DART_APP_DIR
do
    cd "$DART_APP_DIR"
    echo "Running pub get in $DART_APP_DIR"
    $DART_SDK/bin/pub get
    cd - > /dev/null
done
