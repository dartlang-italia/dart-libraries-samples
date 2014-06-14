#!/bin/bash

source _tools/vars.sh

if [[ -z "$DART_SDK" ]]; then
    echo "Warrrrning. \$DART_SDK must be set. Quitting."
    exit
fi

for lib in "${dart_libs[@]}"
do
    if [[ ! -d "$lib" ]]; then
        mkdir "$lib"
    fi
    if [[ -f "$DART_SDK/lib/$lib/$lib.dart" ]]; then
        lib_source="$DART_SDK/lib/$lib/$lib.dart"
    else
        lib_source="$DART_SDK/lib/$lib/dart2js/$lib""_dart2js.dart"
    fi
    echo -e "# dart:$lib\n" > "$lib/README.md"

    # I am sorry.
    sed -n "$(grep -n -m 1 -e "\/\*\*" $lib_source |  cut -f1 -d:)","$( \
        grep -n -m 1 -e "\*\/" $lib_source | cut -f1 -d:)"p $lib_source |  
        sed s/^\ \\*\ //g | sed s/\\/\\*\\*//g | sed s/\\*\\///g >> \
        "$lib/README.md"
done
