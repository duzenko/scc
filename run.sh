#!/bin/bash
set -eo pipefail

TEST_DIR=tests/02-read-string

echo Compiling $TEST_DIR/test.qwe...
awk -v FPAT='"[^"]*"|[^ ]*' -f compiler.awk $TEST_DIR/test.qwe > $TEST_DIR/test.sh

if [ -f "$TEST_DIR/input.txt" ]
then
    echo Testing with input file...
    cat $TEST_DIR/input.txt | $TEST_DIR/test.sh
else
    echo Testing...
    $TEST_DIR/test.sh
fi