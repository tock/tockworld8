# Non-XIP Discussion

Attending:
- Lawrence Esswood
- Amit Levy
- Bobby Reynolds
- Brad Campbell
- Leon Schuermann

- Amit: Non-XIP platforms are "the new norm" (for a subset of users / use-cases)

  Most notable distinguishing factors:
  - There's a lot less overall space for code (RAM less plentiful than RAM+Flash)
  - Relocation is typically less of an issue

  What are the differences?

- Bobby: Creates a severe memory constraint
  - E.g. standard code size mitigations are just no sufficient
  - What other creative ways to expand feature sets. E.g., swapping?
- Lawrence:
  - Started using a lot more constant initializations
  - E.g., boot is pretty much just a couple instructions

- Leon: Why is relocation less of an issue?

- Lawrence: Because the entire process (what would be in RAM + text) moves by a constant offset. Still using PIC, but no work required.

- Bobby: Want to explore dynamically loadable processes in the future, relocation becomes much more important to have.

- Amit: Dynamically loading process from external memory or move binaries around. Can give more degrees of freedom to what can be loaded concurrently.

  Lawrence -- memory constraints as bad for you?

- Lawrence: not as constrained. There are use-cases where we need to work with <100kB.

- Brad: What's the tradeoff for having non-XIP? What is being sacrificed.

- Bobby: Part of its the threat model. Flash executed from might be located outside of the trust model.

- Amit: Can't do flash beyond a certain process node. Tradeoff: SRAM consumes more power.

- Bobby: Power and performance are not paramount for us.

- Lawrence: Chip is used for orchestration, but do not run computation-heavy workloads.

- Amit: Goal? What featureset does the kernel have in these settings?

- Lawrence: **don't like how `elf2tab` is handling relocation sections. Should start `PT_LOAD` around relocation sections.**
  Aligning with the ELF standard around relocations a bit more would be helpful.

- Bobby: **Flexibility with the process loader is important.**

- Leon: What assumptions have we been making in the kernel that do no longer apply?

  For example, app flash driver would break if flash was actually in RAM.

  - Bobby / Lawrence: Layout requirements on processes?

- Amit: would like to have a reference platform for XIP in upstream. What does this platform need to look like?

  - Lawrence: QEMU virt board is sufficient. We have a downstream QEMU virt port that does XIP for kernel, and non-XIP for apps.

  - Bobby: Don't need a special platform at all.

  - Lawrence: assumption about the protection hardware that we have. Padding things sufficiently, ordering them in a certain way.

  - Bobby: maybe changes in the area of memory management? One of the platforms has the capability to virtualize memory addresses.
    Assuming we hack around relocation using the page table. Is there a way where the MPU can also be an MMU?
    - Shared concern by Lawrence.

- Brad: If the kernel doesn't fit entirely in memory, what's taken out?

  - Bobby/Lawrence: just want to swap out apps.
  - Lawrence: preferred policy for us -- not swap out, but just kill and restart later.

- Swapping would be cool, grants make this tricky, if we wouldn't swap grants then we could use `Unpin` to move their contents.

- Proposal: Share QEMU virt implementation, go from there.

- Brad: Once outcome could be a document that we put somewhere and captures what we talked about here. Can make common ground around use-cases and get other people to think about it.

- Bobby: Knowledge that there's others working on this is a good outcome.
