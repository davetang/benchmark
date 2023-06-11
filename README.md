# Various benchmarks.

## GNU time

Use [GNU time](https://www.gnu.org/software/time/) to displays information
about the resources used by a tool.

```console
sudo apt install time
which time
# /usr/bin/time
```

The resource specifiers, which are a superset of those recognized by the
tcsh(1) builtin `time' command, are:

| Specifier | Description |
| --------- | ----------- |
| %      | A literal `%'. |
| C      | Name and command line arguments of the command being timed. |
| D      | Average size of the process's unshared data area, in Kilobytes. |
| E      | Elapsed real (wall clock) time used by the process, in [hours:]minutes:seconds. |
| F      | Number of major, or I/O-requiring, page faults that occurred while the process was running.  These are |
| faults | where the page has actually migrated out of primary memory. |
| I      | Number of file system inputs by the process. |
| K      | Average total (data+stack+text) memory use of the process, in Kilobytes. |
| M      | Maximum resident set size of the process during its lifetime, in Kilobytes. |
| O      | Number of file system outputs by the process. |
| P      | Percentage of the CPU that this job got.  This is just user + system times divided by the total running time.  It also prints a percentage sign. | |
| R      | Number of minor, or recoverable, page faults.  These are pages that are not valid (so they fault) but which have not yet been claimed by other virtual pages.  Thus the data in the page is still valid but the system tables must be updated. |
| S      | Total number of CPU-seconds used by the system on behalf of the process (in kernel mode), in seconds. |
| U      | Total number of CPU-seconds that the process used directly (in user mode), in seconds. |
| W      | Number of times the process was swapped out of main memory. |
| X      | Average amount of shared text in the process, in Kilobytes. |
| Z      | System's page size, in bytes.  This is a per-system constant, but varies between systems. |
| c      | Number of times the process was context-switched involuntarily (because the time slice expired). |
| e      | Elapsed real (wall clock) time used by the process, in seconds. |
| k      | Number of signals delivered to the process. |
| p      | Average unshared stack size of the process, in Kilobytes. |
| r      | Number of socket messages received by the process. |
| s      | Number of socket messages sent by the process. |
| t      | Average resident set size of the process, in Kilobytes. |
| w      | Number of times that the program was context-switched voluntarily, for instance while waiting for an I/O operation to complete. |
| x      | Exit status of the command. |

Add alias.

```console
alias timeit='/usr/bin/env time --format "Real time: %e seconds\nUser time: %U seconds\nSys time: %S seconds\nMax mem: %M Kb\nAvg mem: %K Kb\nCPU: %P"'
```
