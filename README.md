# OpenLane RCA vs CLA using Sky130

---

## Overview

This project presents a comparative ASIC implementation of:

- Ripple Carry Adder (RCA)
- Carry Lookahead Adder (CLA)

across:

- 4-bit designs  
- 16-bit designs  

using the OpenLane RTL-to-GDS flow on the Sky130 PDK.

The objective is to evaluate how adder architecture impacts:

- Timing (critical path delay, slack)
- Area (cell count, utilization)
- Power
- Routing complexity
---

## Author

**Priyadharshan L**  
B.E. Electronics and Communication Engineering  
College of Engineering, Guindy, Anna University

---
## Project structure
```
Radix-4 Multiplier
│
├── src/
│   ├── cla_16bit/
│   │   ├── cla_16bit.v
│   │   ├── cla_16bit_top.v
│   │   ├── cla_4bit_block.v
│   │   ├── config.json
│   │   └── pin_order.cfg
│   │
│   ├── cla_4bit/
│   │   ├── cla_4bit.v
│   │   ├── cla_4bit_top.v
│   │   ├── config.json
│   │   └── pin_order.cfg
│   │
│   ├── rca_16bit/
│   │   ├── rca_16bit.v
│   │   ├── rca_16bit_top.v
│   │   ├── config.json
│   │   └── pin_order.cfg
│   │
│   └── rca_4bit/
│       ├── rca_4bit.v
│       ├── rca_4bit_top.v
│       ├── config.json
│       └── pin_order.cfg
│
├── 16bit_analysis.md
├── 4bit_analysis.md
├── final_comparison.md
└── README.md
```

---

## Ripple Carry Adder (RCA)


### Definition

A Ripple Carry Adder is a combinational circuit formed by cascading full adders, where the carry output of each stage is fed into the next stage.

### Operation

Each stage computes:

- Sum = A ⊕ B ⊕ Cin  
- Cout = AB + ACin + BCin  

Carry propagation:
Cin → C1 → C2 → ... → CN


The carry must propagate through all stages sequentially, which leads to increased delay as bit-width increases. :

### Characteristics

- Simple structure
- Low area and power
- Linear delay growth (O(n))
- Limited performance for large bit-width designs

---

## Carry Lookahead Adder (CLA)

### Definition

A Carry Lookahead Adder improves speed by computing carry signals in advance using generate and propagate logic.

### Key Signals

- Generate: G = A · B  
- Propagate: P = A ⊕ B  

Carry computation is derived using combinational logic:


Ci = Gi + PiCi-1 (expanded recursively)


Instead of waiting for carry propagation, CLA predicts carries in parallel, significantly reducing delay. 

### Characteristics

- Faster carry computation
- Parallel carry generation
- Increased logic complexity
- Higher area and routing overhead

---

## Key Architectural Difference

| Feature | RCA | CLA |
|--------|-----|-----|
| Carry computation | Sequential | Parallel |
| Delay | O(n) | O(log n) |
| Area | Low | Higher |
| Power | Lower | Higher |
| Routing | Simple | Complex |

---

## Project Scope

This project implements and analyzes:

- 4-bit RCA vs CLA  
- 16-bit RCA vs CLA  

using identical constraints:

- Same clock period (5 ns)
- Same floorplan configuration
- Same OpenLane flow stages

This ensures a fair comparison between architectures.

---

## Key Observations (Summary)

### 4-bit Designs

- RCA achieves lower delay than CLA
- CLA overhead dominates for small bit-width
- Routing and implementation are simpler in RCA

### 16-bit Designs

- CLA achieves significantly lower delay
- RCA fails timing initially due to long carry chain
- CLA meets timing without additional optimization

### RCA Optimization

- Timing-driven synthesis and fanout control improve RCA performance
- RCA achieves timing closure without architectural modification
- Demonstrates importance of physical design in ASIC flow

---



