# Assignment 1
- Owen Monus
- Jan 25, 2024
- 200482797

$Y = 1+2+...+N$

### a)
Use the equation Y = N(N+1)/2 when writing the IAS program.

```assembly
// load n into a register
// let n = 6
// 6 is 0b0110

// assume n is at address 000000000001

LOAD MQ,M(X) // load n into mq
00001010 000000000001

LOAD MQ // load mq(which is holding n) into ac
00001010 000000000000

LOAD 

```