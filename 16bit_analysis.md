# 16-bit RCA vs CLA Analysis (OpenLane)

---

## Results Summary (Before Optimization)

| Parameter           | 16-bit CLA | 16-bit RCA | Observation                 |
| ------------------- | ---------: | ---------: | --------------------------- |
| Critical path delay |    2.05 ns |     3.3 ns | CLA is faster               |
| WNS                 |       0.00 |      -0.17 | RCA fails setup timing      |
| TNS                 |       0.00 |      -0.29 | RCA has timing violations   |
| Synth cell count    |        114 |         96 | RCA uses fewer cells        |
| Cells pre-ABC       |        172 |        129 | RCA is logically smaller    |
| OpenDP utilization  |      5.29% |      4.55% | CLA occupies slightly more  |
| Wire length         |       6013 |       5718 | RCA has simpler routing     |
| Vias                |        960 |        855 | RCA uses fewer vias         |
| Power               |    ~520 µW |    ~488 µW | RCA is slightly lower power |
| Same die/core/clock |        Yes |        Yes | Fair comparison             |

---

## Analysis (Before Optimization)

- CLA meets timing constraints with positive slack.
- RCA fails timing due to long ripple carry propagation.
- RCA remains smaller and simpler in terms of logic and routing.

---

## RCA Optimization

### Objective

Achieve timing closure for 16-bit RCA under a 5 ns clock constraint without modifying the architecture.

---

### Optimization Parameters Applied

1. Timing-driven synthesis:
   - `SYNTH_STRATEGY = DELAY 0`

2. Fanout control:
   - `MAX_FANOUT_CONSTRAINT = 6`

3. Pin placement optimization:
   - Interleaved input ordering:
     `A[0], B[0], A[1], B[1], ...`

4. Floorplan refinement:
   - Reduced interconnect length and routing delay

---

## Results Summary (After Optimization)

| Parameter           | RCA before optimization | RCA after optimization |
| ------------------- | ----------------------: | ---------------------: |
| Critical path delay |                  3.3 ns |                2.41 ns |
| WNS                 |                   -0.17 |                   0.00 |
| TNS                 |                   -0.29 |                   0.00 |
| Timing status       |                  Failed |                 Passed |

---

## Analysis (After Optimization)

- RCA successfully meets timing after optimization.
- Critical path delay reduced by ~0.9 ns.
- No setup or hold violations remain.
- Architecture remains unchanged.

---

## Final Comparison

| Parameter        | CLA | RCA (Optimized) |
| ---------------- | --- | --------------- |
| Delay            | 2.05 ns | 2.41 ns |
| Timing           | Pass | Pass |
| Synth cells      | 114 | 96 |
| Power            | ~520 µW | ~500 µW |
| Routing          | Complex | Simpler |

---

## Key Insight

- CLA achieves better timing performance inherently.
- RCA is smaller and more efficient but slower.
- Physical design optimization can significantly improve RCA timing without architectural changes.

---

## Conclusion

For 16-bit adders:

- CLA is preferred for high-performance designs.
- RCA initially fails timing but can be optimized to meet constraints.
- RCA remains advantageous in area, power, and routing simplicity.

This demonstrates the trade-off between architectural efficiency and physical design optimization in ASIC implementation.
