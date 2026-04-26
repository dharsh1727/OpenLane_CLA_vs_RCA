## 1. Introduction

Adders are fundamental arithmetic blocks in digital systems. Two commonly used architectures are:

- Ripple Carry Adder (RCA)
- Carry Lookahead Adder (CLA)

This work analyzes both architectures across different bit-widths (4-bit and 16-bit) using the OpenLane ASIC flow, focusing on timing, area, power, and scalability.

---

## 2. Ripple Carry Adder (RCA)

### Definition

An RCA is a chain of full adders where the carry output of each stage feeds the next stage.

### Operation

For each bit:

Sum = A ⊕ B ⊕ Cin  
Cout = AB + ACin + BCin  

Carry propagates sequentially:

Cin → C1 → C2 → ... → CN

### Characteristics

- Simple structure
- Low area and power
- Linear delay growth with bit-width

### Delay

Delay ∝ O(n)

---

## 3. Carry Lookahead Adder (CLA)

### Definition

CLA reduces carry delay by computing carries in advance using generate and propagate signals.

### Key Signals

Generate:
G = A · B

Propagate:
P = A ⊕ B

### Carry Computation (4-bit example)

C1 = G0 + P0Cin  
C2 = G1 + P1G0 + P1P0Cin  
C3 = G2 + P2G1 + P2P1G0 + P2P1P0Cin  
C4 = G3 + P3G2 + P3P2G1 + P3P2P1G0 + P3P2P1P0Cin  

### Characteristics

- Faster than RCA for larger bit-widths
- Parallel carry computation
- Higher area and routing complexity

### Delay

Delay ≈ O(log n)

---

## 4. Methodology

The designs were implemented using the OpenLane RTL-to-GDS flow:

- RTL Design (Verilog)
- Synthesis
- Floorplanning
- Placement
- Clock Tree Synthesis
- Routing
- Static Timing Analysis (STA)
- Signoff (DRC, LVS)

### Setup

- Top wrapper with flip-flops for STA
- Clock period: 5 ns
- Same floorplan constraints for 16-bit comparison

---

## 5. 4-bit Analysis

### Results

CLA (4-bit):
- Delay ≈ 1.11 ns
- Power ≈ 213 µW

RCA (4-bit):
- Delay ≈ 0.94 ns
- Power ≈ 208 µW

### Observation

RCA performs better than CLA for 4-bit.

### Reason

- RCA carry chain is short
- CLA introduces extra generate/propagate logic
- Logic overhead dominates at small bit-widths

### Conclusion

For small designs, RCA is more efficient due to lower complexity and better synthesis optimization.

---

## 6. 16-bit Analysis (Before Optimization)

### Results

CLA (16-bit):
- Delay ≈ 2.05 ns
- WNS = 0.0
- TNS = 0.0
- Meets timing

RCA (16-bit):
- Delay ≈ 3.3 ns
- WNS = -0.17
- TNS = -0.29
- Fails timing

### Observation

CLA outperforms RCA at 16-bit.

### Reason

- RCA carry propagates through all bits
- CLA computes carries in parallel

### Conclusion

CLA is required for high-speed operation in larger bit-width designs.

---

## 7. RCA 16-bit Optimization

### Objective

Achieve timing closure for RCA at 5 ns without changing architecture.

### Techniques Applied

1. Timing-driven synthesis  
   SYNTH_STRATEGY = DELAY 0

2. Fanout control  
   MAX_FANOUT_CONSTRAINT = 6

3. Pin placement optimization  
   Interleaved input ordering: A[0], B[0], A[1], B[1], ...

4. Floorplan tightening  
   Reduced interconnect delay

---

## 8. 16-bit Results (After Optimization)

Optimized RCA (16-bit):
- Delay ≈ 2.41 ns
- WNS = 0.0
- TNS = 0.0
- Timing closure achieved

---

## 9. Final Comparison

### 4-bit

| Metric | CLA | RCA |
|--------|-----|-----|
| Delay | 1.11 ns | 0.94 ns |
| Power | 213 µW | 208 µW |
| Area | Similar | Similar |

Result: RCA is better

---

### 16-bit

| Metric | CLA | RCA | RCA (Optimized) |
|--------|-----|-----|----------------|
| Delay | 2.05 ns | 3.3 ns | 2.41 ns |
| WNS | 0.0 | -0.17 | 0.0 |
| TNS | 0.0 | -0.29 | 0.0 |
| Cells | 114 | 96 | 96 |
| Power | ~520 µW | ~488 µW | ~504 µW |

---

## 10. Trade-off Summary

| Parameter | CLA | RCA |
|----------|-----|-----|
| Speed | Higher | Lower |
| Area | Larger | Smaller |
| Power | Higher | Lower |
| Complexity | High | Low |
| Routing | Complex | Simple |

---

## 11. Key Insights

- RCA performs better at small bit-widths
- CLA performs better at larger bit-widths
- RCA fails timing initially at 16-bit
- Physical design optimization enables RCA to meet timing
- Architecture defines baseline performance
- Physical design determines timing closure

---

## 12. Conclusion

RCA is suitable for small, area-constrained designs, while CLA is preferred for high-speed applications at larger bit-widths. However, careful physical design optimization can significantly improve RCA performance, allowing it to meet moderate timing constraints without altering the architecture.
