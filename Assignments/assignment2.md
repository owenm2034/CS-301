# CS 301 Assignment 2
- Owen Monus
- March 4th, 2024
- 200482797
  
1.  Consider two different machines, with two different instruction sets, both of which have a
clock rate of 200 MHz. The following measurements are recorded on the two machines running a given
set of programs.

||Instruction Type | Instruction Count (millions) | Cycles per Instruction|
|---|---|---|---|
|**Machine A**| | | |
||Arithmetic and logic|8|1|
||Load and store|4|3|
||Branch|2|4|
||Others|4|3|
|**Machine B**| | | |
||Arithmetic and logic|10|1|
||Load and store|8|2|
||Branch|2|4|
||Others|4|3|

Determine the effective CPI, MIPS rate, and execution time for each machine.

- MIPS = f / (CPI x 10<sup>6</sup>)
  - CPI = ∑ i
- ∑ (CPI<sub>i</sub> * I<sub>i</sub>) / I<sub>c</sub>