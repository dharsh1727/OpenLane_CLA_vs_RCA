# 4-bit RCA vs CLA Analysis (OpenLane)

---

## Results Summary

| Parameter           | 4-bit CLA | 4-bit RCA | Observation                      |
| ------------------- | --------: | --------: | -------------------------------- |
| Critical path delay |  ~1.11 ns |  ~0.94 ns | RCA is faster                    |
| Synthesis area      |      ~219 |    ~188.9 | RCA is smaller initially         |
| Cell area           |  ~325 µm² |  ~325 µm² | Nearly same after implementation |
| Core area           | ~9774 µm² | ~9774 µm² | Same fixed core constraint       |
| Power               |   ~213 µW |   ~208 µW | Nearly same, RCA slightly lower  |
| Utilization         |    ~3.48% |    ~3.16% | RCA slightly lower utilization   |
| Wire length         |      1291 |      1206 | RCA has simpler routing          |
| Vias                |       246 |       205 | RCA has fewer vias               |
| WNS                 |      0.00 |      0.00 | Both meet timing                 |
| TNS                 |      0.00 |      0.00 | Both clean                       |
| DRC/LVS             |    Passed |    Passed | Both clean                       |

---

## Analysis

For the 4-bit implementation, the Ripple Carry Adder (RCA) demonstrates better performance than the Carry Lookahead Adder (CLA).

- The RCA achieves a lower critical path delay (~0.94 ns vs ~1.11 ns).
- Power and area remain nearly identical for both designs.
- RCA exhibits simpler routing with reduced wire length and fewer vias.

---

## Key Insight

Although CLA is theoretically faster, for small bit-width designs:

- Carry propagation delay in RCA is minimal (only 4 stages).
- CLA introduces additional generate/propagate logic.
- This added logic increases gate delay and fan-in complexity.

---

## Conclusion

For 4-bit adders:

- RCA is faster
- RCA is simpler to route
- CLA provides no timing advantage

Therefore, RCA is the preferred architecture for small-scale adders.
