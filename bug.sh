#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes concurrently
(while true; do echo "Process 1: Writing to file1.txt"; echo "Process 1" >> file1.txt; sleep 1; done) & 
(while true; do echo "Process 2: Writing to file2.txt"; echo "Process 2" >> file2.txt; sleep 1; done) &

# Wait for a while to let the processes run
sleep 10

# Stop the processes (This part is imperfect and should be improved)
kill %1
kill %2

# Attempt to read the files (the contents will be interleaved and not atomic)
cat file1.txt
cat file2.txt