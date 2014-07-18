#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
find . -name "*.dart" -printf 'dartanalyzer %p\n' > "$DIR/run_dartanalyzer.sh"
