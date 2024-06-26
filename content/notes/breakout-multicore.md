# Multicore

Agenda:
- Define what multicore means in the context of Tock?
- Use-cases / examples
- Existing effort
- Next steps

### Leon's Use Case
* Leon: Princeton working on systems such as information leak detection, which runs on two platforms and compares results
* Leon: Our systems share some memory, but not all of the memory. We could have two kernels that exchange information
    * We're not interested in SMP, but rather multiple coordinating instances of Tock
    * It's pretty easy to do without changing much of the architecture
* Alex: How does one core start the other core?
    * Leon: One core starts at a given address, and the other is asleep, then there's a hardware interface for starting the second core
    * Leon: So the first kernel starts a main function, and then kicks off the other kernel's main function

### Alex's Use Cases
 * Alex: RPi has two cores, but there's no way to use two cores right now. There are some applications that require enough performance that could really use two cores
     * This is two kernels running, where each is in charge of different peripherals
 * Alex: In industrial settings, we have been asked "how do you handle this chip" many times
 * Alex: Another example, which have chips with assymetric cores: M4 and M7 for instance. There are even ARM R and M cores.

### Branden's Use Case
- On Signpost: multi-microcontroller system, different dedicated tasks
- More recently: undergrad project
  - Tock on two nRF52840DKs, can I ship system calls between both?
  - App on board A does system call, kernel ships it to B, ships result back
  - Easy for command-style system calls
  - Hard part: memory sharing

### Petteri's Use Case
* SoC where Tock runs on some co-processor, but the another core which runs some different OS (maybe Tock, or maybe otherwise)
* So IPC between applications on different CPU would be valuable here

### High-Level Goals and Considerations
- Isolate untrusted / semitrusted workloads
- Use co-processor for dedicated computation-heavy tasks
- Applications should be running on either core, system calls should still work "as normal"? Basically SMP
    - Is this required? Could we split the applications into separate parts?
    - Maybe? We would need a really good IPC mechanism?
    - Sharing peripherals between kernels sounds very difficult
    - Two options:
        - In-kernel mechanism: "remote system calls"
        - In-kernel mechanism: stub driver that remotes the interaction (example, the GPIO "driver" actually sends a message to the other kernel)
        - Userspace mechanism: IPC with a "service" that runs on other kernel instance
- Do we need locks?
    - Maybe?
- Implementation of kernel-to-kernel communication
    - We can share static mut buffers between kernels by giving ownership to other
- IPC implementation
    - Read/write message interface should look the same no matter whether it's within a single core, or across two cores
    - You can't assume that the two applications have access to the same memory
    - Alex: Would you have the ability to queue messages, or just write directly into an allowed buffer?
    - Leon: We should almost certainly have multiple different IPC implementations / interfaces

### Issues
- Tock is inherently single-threaded, has its merit
  - Making it into multi-threaded system is going to be hard and have tradeoffs
- Multi-kernel with Linux has problems -- scheduling efficiency, etc.
- Peripherals cannot be shared between kernels
- 

### Takeaways
- A non-goal is one kernel that controls two or more cores. All multicore designs are also multikernel designs.
- Applications are located on a single core/kernel and do NOT migrate at runtime.
    - The only eventual migration would be stopping the application, moving the application, and restarting (essentially re-programming which one it's installed on)
- IPC efforts for inter-process communication should also support inter-processor communication
- 

### Next Steps
1. Fix IPC (remove current? Add new implementation(s))
2. Upstream CoreLocal
3. Timeline for Upstreaming


