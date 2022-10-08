#!/bin/bash

dotnet jb inspectcode Notion.sln -f="Text" --no-build --include="**.cs" -o=".lint/CodeWarningResults.txt"

totalLines=`cat .lint/CodeWarningResults.txt | grep "^.*$" -c`

if [[ "$totalLines" -gt 1 ]]; then
    echo "There are few linter warnings - please fix them before running the pipeline"
    cat .lint/CodeWarningResults.txt
    exit 1
fi
