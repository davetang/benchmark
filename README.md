# Various benchmarks

Ways to profile CPU and memory usage according to Llama3.3.

```console
ollama run llama3.3 Opensource software available for Linux, specifically Debian, that can be used to measure the runtime and memory usage of a command
```
```
To measure the runtime and memory usage of a command on Debian (or any Linux system), you have several open-source tools at your disposal. Here are some of the most commonly used ones:

1. **time**: The `time` command is a simple tool for measuring the execution time of a command. It reports the real time, user CPU time, and system CPU time.
   - Usage: `time your_command`

2. **/usr/bin/time** (if `/usr/bin/time` is different from the shell built-in `time`, it provides more detailed statistics):
   - Some systems have a more verbose version of `time` in `/usr/bin/time`. This can be used instead of the shell's built-in `time` for more detailed output.
   - Usage: `/usr/bin/time your_command`

3. **sysdig**: While not exclusively for measuring command runtime and memory, sysdig is a powerful system monitoring tool that can be used to capture detailed information about system calls, including those related to process
execution and resource usage.
   - Installation: `sudo apt-get install sysdig`
   - Usage example (capturing system calls): `sysdig "proc.name = your_command"`

4. **perf**: This is a performance analysis tool for Linux. It can be used to measure various aspects of system and application performance, including CPU cycles, memory access patterns, and more.
   - Installation: `sudo apt-get install linux-tools-common`
   - Usage example (measuring CPU cycles): `perf stat your_command`

5. **strace**: While primarily used for tracing system calls, it can indirectly help in understanding how a command uses resources by showing the sequence of system calls made during its execution.
   - Installation: `sudo apt-get install strace`
   - Usage: `strace your_command`

6. **ltrace**: Similar to strace but for library calls instead of system calls. This can provide insights into memory usage and other resource utilization patterns by tracing the dynamic library calls a command makes.
   - Installation: `sudo apt-get install ltrace`
   - Usage: `ltrace your_command`

7. **valgrind**: Although primarily used as a memory debugger, valgrind can also measure the execution time of programs and profile their CPU usage, among other things.
   - Installation: `sudo apt-get install valgrind`
   - Usage example (measuring memory leaks): `valgrind --leak-check=full your_command`

8. **systemd-analyze**: If you're running a systemd-based system (which Debian is by default), you can use `systemd-analyze` to analyze the execution time of services or commands, though it's more geared towards services.
   - Usage: `sudo systemd-analyze verify your_service_name`
   - For command analysis, other tools listed here are likely more suitable.

To specifically measure memory usage, tools like **pmap** (for process memory mapping), **smem**, and **memusage** (part of the GNU C Library, used to profile memory usage) can be quite useful:
- **pmap**: Installation might not be required; usage example: `pmap -d $(pidof your_command)`
- **smem**: Not always available in default repositories but can be installed via `sudo apt-get install smem` if available.
- **memusage**: Part of the GNU C Library, used as `memusage your_command`.

Each of these tools provides different insights into how a command utilizes system resources. Choose the one that best fits what you're trying to measure or analyze.
```

Using `memusage`.

```console
memusage ollama run llama3.3 How do I use memusage to measure the memory usage of a command
```
```
`memusage` is a command that reports the memory usage of a process. To use `memusage` to measure the memory usage of a command, you can follow these steps:

1. **Install `memusage`**: If you haven't already installed `memusage`, you may need to install it first. On Ubuntu or Debian-based systems, you can do this by running `sudo apt-get install memusage`.
2. **Basic Usage**: The basic syntax for using `memusage` is as follows:
   ```
   memusage command [arguments]
   ```
   Replace `command` with the command you want to measure memory usage for, and `[arguments]` with any arguments that command requires.

3. **Example**: For instance, if you want to measure the memory usage of a simple Python script named `example.py`, you would run:
   ```
   memusage python example.py
   ```
   This will execute your Python script (`python example.py`) and report on its memory usage.

4. **Understanding Output**: The output of `memusage` typically includes information about the maximum resident set size (RSS) of the process, which is a measure of the portion of memory occupied by a process. You might also
see other statistics depending on your system and the version of `memusage`.

5. **Tips**:
   - Ensure you have the correct permissions to run both `memusage` and the command you're measuring.
   - Some commands or scripts might behave differently when run under `memusage`, especially if they detect being run in a debugging or tracing environment.
   - For more detailed memory usage analysis, consider using other tools like `valgrind` (with its massif tool), `sysdig`, or system-specific utilities.

Remember, the availability and specifics of `memusage` can vary between different Unix-like operating systems. If you encounter issues or `memusage` is not available on your system, exploring alternative methods for measuring
memory usage may be necessary.
```

## GNU time

Use [GNU time](https://www.gnu.org/software/time/) to displays information
about the resources used by a tool.

```console
sudo apt install time
which time
# /usr/bin/time
```

The resource specifiers of GNU time, which are a superset of those recognised
by the tcsh builtin `time` command, are:

| Specifier | Description |
| --------- | ----------- |
| %     | A literal `%`. |
| C      | Name and command line arguments of the command being timed. |
| D      | Average size of the process's unshared data area, in Kilobytes. |
| E      | Elapsed real (wall clock) time used by the process, in [hours:]minutes:seconds. |
| F      | Number of major, or I/O-requiring, page faults that occurred while the process was running.  These are faults where the page has actually migrated out of primary memory. |
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

[Resident Set Size](https://en.wikipedia.org/wiki/Resident_set_size) (RSS) is
the portion of memory (measured in kilobytes) occupied by a process that is
held in main memory (RAM).

Use `script/timeit.sh` to collect all `time` resource usages.

```console
./script/timeit.sh ./script/mandelbrot.pl 10000
```
```
Elapsed 8 seconds
command,/home/dtang/github/benchmark/script/mandelbrot.pl 10000
elapsed_real_time,0:07.73
elapsed_real_time_sec,7.73
perc_cpu,99%
user_cpu,7.71
sys_cpu,0.00
avg_total_mem,0 KB
max_rss,2560 KB
avg_rss,0 KB
sys_page_size,4096 B
avg_size_unshared_data_area,0 Kb
avg_unshared_stack_size,0 Kb
major_page_faults,0
minor_page_faults,1045
num_filesys_inputs,0
num_filesys_outputs,0
num_swap,0
avg_shared_txt,0
num_signals,0
num_socket_msg_received,0
num_socket_msg_sent,0
num_context_switched_vol,1
num_context_switched_invol,164
rc,0
```
