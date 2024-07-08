---
title: "Breakout: CHERI"
---

## Attendees

- Lawrence Esswood, Google, CHERI & CHERIOS at Cambridge
- Kevin Lee, Microsoft
- Florian Gilcher, Ferrous Systems
- Amit Levy

## Notes

Overview:
* RISC-V Cheri seems to be the future

Prototyping tock:
* QEMU is the best option
* QEMU has support for this
* rustc-cheri is really annoying and you need an LLVM with a CHERI backend
  * Open source version is good enough
  * LLVM is good enough, clang is good enough
  * rustc is not there yet
* Rustc compiler support for capability
* Mapping of LLVM-intrinsics to libcore would be useful
* Most of the problems are toolchain issue
* TockOS as a client for pointer provenance

* TockOS needs general refactoring -> to refactor to strict provenance
* Does not compile with strict_provenance
* The number of capabilities added to Tock is minimal, there could be more added
* TockOS CHERI patches is currently using _hybrid_ CHERI (mixing cap pointers and non-cap pointers)
* How about adding a libcheri to rustc library set?
  * New assembly constraints for capability registers
* Can you ban raw pointers without capabilities?
  * Clippy?
* Open questions
  * What is purecap Rust?


## Takeaway

* rustc support, particularly for pointer provenance, is the big blocker
* Tock OS can be the lead user to advocate for rustc changes
* Other teams at Google & Microsoft interested in CHERI support in rustc as well
* Follow up with plan to push for support in Rust project
