#!/bin/bash



CTX="$1"
PROCESS_FILE="$2"
MAX_INSTRUCTIONS=100000000

./m2s \
    --x86-sim detailed                  \
    --x86-max-inst $MAX_INSTRUCTIONS    \
    --x86-config $PROCESS_FILE          \
    --ctx-config $CTX                   \
