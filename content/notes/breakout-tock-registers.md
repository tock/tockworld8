---
title: "Breakout: Tock Registers"
---

## Attendees:

* Johnathan Van Why
* Alyssa Haroldsen
* Max Cura (Stanford)
* Kevin Lee (Microsoft)
* Branden Ghena
* Pat Pannuto


Addressing open questions in Tock registers PR
https://github.com/tock/tock/pull/4001

## Notes

Background

* Tock registers two goals: sound + nice to use
* Succeed at nice to use
* Totally failed at the soundness?
   * References to non-regular memory is questionably sound
* So the redesign approaches the soundness issues
* Bonus: this adds unit testing mockup support
   * Which is pretty high value

Padding syntax
* We’re going with Syntax C, which we all seemed in agreement on

Inferred offsets
* Alyssa: useful, but not strictly necessary. Easier for adopting existing C code
* Pat: tracking down mistakes here is BAD. And any real system should know the actual locations
* So the offsets should be EXPLICIT
   * Although gaps between them can be implicit
* Right now, the padding existence is explicit, but the amount is implicit
* For the most part, you’re talking to hardware peripherals hanging off of memory busses
* For the LiteX board, since it’s an FPGA you can compile memory bus width at build time
   * And they allow any bit-size registers on any bit-size bus
* Branden: Does LiteX need multiple, or could it just pick one?
   * Johnathan: People might need to have multiple implementations
   * Johnathan: We could have our implementations somehow generically specify which LiteX config you are supporting
* Branden: This is like a family of Microcontrollers? Where you might have extra registers or different offsets?
   * Pat: That’s usually only one or two small changes which could be cfg’d
   * Pat: But LiteX would be an entirely separate version
* Pat: It feels like LiteX is a special case, and they are okay to write things multiple times
* Johnathan: The Bus Adapter allows you to talk to differently sized things
* Branden: Is this necessary? I don’t want tons of overcomplication for one special-purpose things

unsafe
* not granular enough

array of peripherals
* Explanation: set of a couple registers, which are then repeated N times
   * Where accessing them with indexing is important
* blocker for ti50
   * Which has an iteration of N pins configurations


User ergonomics
* Kevin: With the current implementation, you could write a value to a field that doesn’t fit in the field’s width
* And you can’t set read/write on a per-field basis, only on a per-register basis
* Pat: Aliased registers somewhat address that, by separating the read and write views of a register
* Kevin: And many bits are reserved, and need to not be written
* Alyssa: So this would look like a new type around an integer that would limit the possible values
   * And a read/write mask
* Alyssa: So I’d implement that as a data type, which can be guaranteed at compile time, then the runtime doesn’t need to check the value
* Pat: Maybe we could disallow the .val() method and restrict some register accesses to only use the enum set bit interface
