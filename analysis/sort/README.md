# Benchmarking of GNU sort

Testing GNU sort.

```console
mkdir -p bin
gcc src/rand.c -o bin/random

mkdir -p data
./src/gen.sh

mkdir -p results
./src/bench.sh | tee results/out.csv
```

# Results

Variables to test:

1. CPU type
2. Number of processors `--parallel`
3. Buffer size `--buffer-size`

`src/bench.sh` to run the tests.

# CPU

Intel(R) Core(TM) i7-9700 CPU @ 3.00GHz

```
Architecture:                       x86_64
CPU op-mode(s):                     32-bit, 64-bit
Address sizes:                      39 bits physical, 48 bits virtual
Byte Order:                         Little Endian
CPU(s):                             8
On-line CPU(s) list:                0-7
Vendor ID:                          GenuineIntel
Model name:                         Intel(R) Core(TM) i7-9700 CPU @ 3.00GHz
CPU family:                         6
Model:                              158
Thread(s) per core:                 1
Core(s) per socket:                 8
Socket(s):                          1
Stepping:                           13
CPU(s) scaling MHz:                 17%
CPU max MHz:                        4700.0000
CPU min MHz:                        800.0000
BogoMIPS:                           6000.00
```
