#!/bin/bash

#Improved version using process substitution and flock for atomic operations

# Create two files
touch file1.txt
touch file2.txt

# Use process substitution and flock to avoid race conditions
(flock -n 200 file1.txt; while true; do echo "Process 1: Writing to file1.txt"; echo "Process 1" >> file1.txt; sleep 1; done) 200>&1 1>&2 & 
(flock -n 200 file2.txt; while true; do echo "Process 2: Writing to file2.txt"; echo "Process 2" >> file2.txt; sleep 1; done) 200>&1 1>&2 &

# Wait for a while to let the processes run
sleep 10

# Stop the processes (This part is imperfect and should be improved)
kill %1
kill %2

# Read the files (now with consistent content)
cat file1.txt
cat file2.txt