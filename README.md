# Race Condition Bug in Bash

This repository demonstrates a race condition bug in a bash script involving concurrent file writing. Two processes write to separate files simultaneously, leading to unpredictable interleaved output. The solution addresses this by using process substitution and file locking to ensure atomic operations.

## Bug Description
The `bug.sh` script creates two files and then launches two processes that concurrently write to them.  Because the writes are not synchronized, the resulting file content is unpredictable and interleaved, highlighting the race condition.

## Solution
The `bugSolution.sh` script provides a solution using process substitution and file locking (`flock`) to ensure atomic writes, preventing interleaved output and resolving the race condition.