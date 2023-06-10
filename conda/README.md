## README

Run scripts.

```console
for s in conda.sh conda_mamba.sh mambaforge.sh; do ./run_docker.sh ${s}; done
```

Conda.

```console
tail -3 conda_stderr.out
# real    7m1.701s
# user    7m26.079s
# sys     0m9.790s
```

Conda + Mamba.

```console
tail -3 conda_mamba_stderr.out
# real    1m0.181s
# user    1m31.252s
# sys     0m50.962s
```

Mambaforge.

```console
tail -3 mambaforge_stderr.out
# real    1m0.244s
# user    1m30.827s
# sys     0m51.050s
```

## System stats

CPU.

```console
sudo lscpu
```
```
Architecture:                    x86_64
CPU op-mode(s):                  32-bit, 64-bit
Byte Order:                      Little Endian
Address sizes:                   39 bits physical, 48 bits virtual
CPU(s):                          4
On-line CPU(s) list:             0-3
Thread(s) per core:              1
Core(s) per socket:              4
Socket(s):                       1
NUMA node(s):                    1
Vendor ID:                       GenuineIntel
CPU family:                      6
Model:                           158
Model name:                      Intel(R) Core(TM) i5-7500 CPU @ 3.40GHz
Stepping:                        9
CPU MHz:                         891.653
CPU max MHz:                     3800.0000
CPU min MHz:                     800.0000
BogoMIPS:                        6799.81
L1d cache:                       128 KiB
L1i cache:                       128 KiB
L2 cache:                        1 MiB
L3 cache:                        6 MiB
NUMA node0 CPU(s):               0-3
Vulnerability Itlb multihit:     KVM: Mitigation: VMX unsupported
Vulnerability L1tf:              Mitigation; PTE Inversion
Vulnerability Mds:               Vulnerable: Clear CPU buffers attempted, no microcode; SMT disabled
Vulnerability Meltdown:          Mitigation; PTI
Vulnerability Mmio stale data:   Vulnerable: Clear CPU buffers attempted, no microcode; SMT disabled
Vulnerability Retbleed:          Mitigation; IBRS
Vulnerability Spec store bypass: Vulnerable
Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:        Mitigation; IBRS, IBPB conditional, STIBP disabled, RSB filling, PBRSB-eIBRS Not affected
Vulnerability Srbds:             Vulnerable: No microcode
Vulnerability Tsx async abort:   Vulnerable: Clear CPU buffers attempted, no microcode; SMT disabled
Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti ibrs ibpb stibp fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp
```
