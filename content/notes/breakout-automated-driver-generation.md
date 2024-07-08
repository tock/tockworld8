+++
title = "Breakout: Automated Driver Generation"
+++

## Attendees
 - Brad Campbell
 - Pat Pannuto
 - Bobby Reynolds
 - Evan Johnson

## Notes

- driver definition: basically the source code
- idea: create some file which defines all of the valid syscalls, that can expand to the match statement in the capsule
- question
  - does this generate code which is checked in?
  - or is this part of the build system that generates on the fly
- is this a DSL?
  - concerned about having to implement a dsl
- bindgen for rust
- probably need some sort of language to define a syscall_driver implementation
- should be able to define a contract
- what about just doing it in rust?
  - then even the rustdocs become the doc (no separate markdown)
  - how does that become bindings?
    - some sort of tool
  - can include since and deprecated tags
    - match app expectations
  - other extensions?
    - verify that each command only returns _one_ syscall success type
    - limit the set of `ErrorCode`s that are valid
- generate the userspace bindings based on the kernel binary

## Plan

- Move markdown docs to rust source files
- Tooling parses source rust to generate c/rust code for userspace binding
