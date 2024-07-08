## Remove Kernel Panic Notes:

- Remove panics from Tock and keep them out. Introduce a link failure if panic is linked in. Advantage: at the build phase; Disadvantage: harder for developers.
- Two categories of panics:
    - slicing panics
    - issues during initialization (no way to remove without unsoundness) => call this a fault (super set of panic)
- Faults:
    - One Fault entry point that takes simple message to report which fault occurred and relevant information.
    - This replaces functionality of panic.
    - Replace all unavoidable panic with fault id (unique).
    - All that fault would do is simple printout and abort.
    - The new panic handler would do exactly what it does today except it would reference the fault handler.
    - The goal is to prevent reintroduction of unexpected panics.
- Two Approaches to check for panics:
    1. Have panic handler call no_mangle well named symbol so we can check output artifact.
    2. Produce linker error on panic use.
- Drawbacks:
    - Somewhat sensitive to compiler changes.
- Downstream users want this.
- Next Steps:
    - Alyssa will make RFC / solicit feedback.
    - Focus first on kernel board files.
    - Capsules will be secondary goal.
