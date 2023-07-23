#!/bin/bash
set -eo pipefail

TEST_DIR=tests/01-hello-world
TEST_DIR=tests/02-read-string
TEST_DIR=tests/03-if

for TEST_DIR in tests/*
do
    echo $TEST_DIR
#    echo Compiling $TEST_DIR/test.qwe...
    awk -v FPAT='"[^"]*"|[^ ]*' -f compiler.awk $TEST_DIR/test.qwe > $TEST_DIR/test.sh

    for f in $TEST_DIR/input*.txt
    do
        if [ -f "$f" ]
        then
#            echo Testing with input file $f...
            cat $f | $TEST_DIR/test.sh
            TESTED=true
        else
#            echo Testing...
            $TEST_DIR/test.sh
        fi
    done
    echo
done
