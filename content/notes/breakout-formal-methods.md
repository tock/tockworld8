---
title: "Breakout: Formal Methods"
---

## Attendees

- Evan Johnson
- ??

## Notes

* Google attempted (and failed) to do some Tock verification in Kani work
* had a bad experience with Kani, easy to write a proof that doesn't actually verify what you want
* Tried using CBMC verification
* https://github.com/model-checking/kani
* Google was verifying their own drivers and user space code
* This particular team stays close to upstream

Could convert Tock TRD to formal spec. Issue with a lot of current specs not being up-to-date (in draft hell)

## Takeaway

* Stuff is actually happening in verification here.
  * Google wants to wait for work to continue
  * They are out of resources for the next year
  * UCSD is doing work with Flux and Verus in Tock
  * There is a lot of tools and development
    * Many initiatives but no concrete best approach yet
  * Eclipse is going to make formal requirement tool

## Action items

* We will wait and see what comes out of verification of syscall API and memory model (by people at UCSD).
* Action item is to set up a communication channel.
* Reach out to verus if they are interested in working on Tock as a real world verification target.
* Plug google in with updates and figure out who all is working in this. Connect with Rust verification group or have a 6 month check in.

## Goal

* touch point between people working on verification before next tockworld
