#!/bin/bash

source _tools/vars.sh

if [[ -z "$DART_SDK" ]]; then
    echo "Warrrrning. \$DART_SDK must be set. Quitting."
    exit
fi

for LIB in "${DART_LIBS[@]}"
do
    if [[ ! -d "$LIB" ]]; then
        mkdir "$LIB"
    fi

    if [[ -f "$DART_SDK/lib/$LIB/$LIB.dart" ]]; then
        LIB_SOURCE="$DART_SDK/lib/$LIB/$LIB.dart"
    else
        LIB_SOURCE="$DART_SDK/lib/$LIB/dart2js/$LIB""_dart2js.dart"
    fi
    echo -e "# dart:$LIB\n" > "$LIB/README.md"

    # Here we use _parseLinks.py to extract links from links.json and appending them -- if any --
    # to the READMEs.

    # TODO: here we assume script is run from root dir, bad things can happen if we run it from
    # elsewhere.

    python3 _tools/_parseLinks.py $LIB >> "$LIB/README.md"

    if [[ ${DOM_PREFIXED_LIBS[@]#$LIB} == ${DOM_PREFIXED_LIBS[@]} ]]; then
      PREFIX="dart"
    else
      PREFIX="dart-dom"
    fi

    API_DOC_URL="https://api.dartlang.org/apidocs/channels/stable/dartdoc-viewer/$PREFIX-$LIB"

    echo -e "API Reference: [dart:$LIB library]($API_DOC_URL) \n\n---\n" >> "$LIB/README.md"

    # I am sorry.
    sed -n "$(grep -n -m 1 -e "\/\*\*" $LIB_SOURCE |  cut -f1 -d:)","$( \
      grep -n -m 1 -e "\*\/" $LIB_SOURCE | cut -f1 -d:)"p $LIB_SOURCE |
      sed '1d;$d' |
      sed -r 's/\ \*( |)//' |
      sed 's/^\*\ //g' |
      sed ':a;N;$!ba;s/]\n(/](/g' >> "$LIB/README.md"
done
