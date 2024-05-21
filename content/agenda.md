+++
title = 'Agenda'
date = 2023-12-18T00:11:39-05:00
draft = false
+++

## Day 1 (June 26th, 2024) - Contributors Day

The first day is intended for current _and future_ contributors to the Tock
project to have in-depth discussions focused on the development of the Tock
kernel, the Tock application runtime, and other projects in the Tock ecosystem.
This will feature talks about new experimental Tock features, discussions on
future Tock designs, and work on prototyping new features.

The discussions will be highly technical and Tock-specific. If that resonates
with you, please plan to attend!

### Schedule
<small>_If you would like to add something to contributors day, please reach
out to the TW7 organizers (Pat, Brad, & Amit)._</small>

| Time  | Room | Topic                                           | Speaker / Discussion Lead   |
|-------|------|-------------------------------------------------|-----------------------------|
|  8:10 | 1244 | _Breakfast_                                     |                             |
|  9:00 | 1242 | Welcome & Introductions                         | Pat Pannuto, UCSD           |
|  9:15 | 1242 | The State of Tock                               | Pat Pannuto, UCSD           |
|  9:45 | 1242 | Working Group Reports                           |                             |
|  9:46 | 1242 | [WG] Core                                       | Amit Levy, Princeton        |
|  9:55 | 1242 | [WG] Networking                                 | Branden Ghena, Northwestern |
| 10:05 | 1242 | [WG] OpenTitan                                  | [tbd]                       |
| 10:15 | 1242 | [WG] Documentation                              | Brad Campbell, UVA          |
| 10:25 | 1242 | Other Sub-project reports (libtock-c,rs, etc.)  | [various]                   |
| 10:40 | 1244 | _Coffee Break / Schedule Catch-up_              |                             |
| 11:00 | 1242 | Kernel Size and Panic Mitigation                | Hudson Ayers, Cruise        |
| 11:30 | 1242 | Using C code securely                           | Leon Schuermann, Princeton  |
| 12:00 | Courtyard | _Lunch break_                                   |                             |
| 13:00 | 1242 | Teaching, Documentation, and Support Discussion | Branden Ghena, Northwestern |
| 13:30 | 1242 | Follow up from TockWorld6                       | Brad Campbell, UVA          |
| 14:00 | 1241, 1242, 1244, 1202 | Breakout: Vision and Future Development (1)     | [various]                   |
| 15:00 | 1241, 1242, 1244, 1202 | Breakout: Vision and Future Development (2)     | [various]                   |
| 16:00 | 1242 | Tock Governance Planning                        | Amit Levy, Princeton        |
| 16:45 | 1242 | Wrap-up                                         | Pat Pannuto, UCSD           |

## Day 2 (June 27th, 2024) - Ecosystem

Day two will feature a more general program focused around Tock, root of trust,
and secure embedded devices. All who are interested in Tock and security-focused
operating systems are invited to attend.

<style>
.break {
  text-align: center;
}

.lightning {
  font-size: smaller;
  border-collapse: collapse;
}
.lightning td {
  padding-top: 0;
  padding-bottom: 0;
  border: none;
}
</style>

<table>
  <tr>
    <th>Time</th>
    <th>Room</th>
    <th>Topic</th>
    <th>Speaker</th>
  </tr>
  <tr>
    <td>8:10</td>
    <td>1244</td>
    <td colspan="2" class="break"><i>Breakfast</i>
    <p>Light, continental breakfast (yogurt parfait, bagels, and similar fare)</p></td>
  </tr>
  <tr>
    <td>8:55</td>
    <td>1242</td>
    <td>Welcome &amp; Opening Remarks</td>
    <td>Pat Pannuto, <a href="https://ucsd.edu/">UC San Diego</a></td>
  </tr>
  <tr>
    <td>9:00</td>
    <td>1242</td>
    <td><b>Keynote—</b> Ferrocene</td>
    <td>Florian Gilcher, <a href="https://ferrous-systems.com/">Ferrous Systems</a></td>
  </tr>
  <tr>
    <td>10:00</td>
    <td>1244</td>
    <td colspan="2" class="break"><i>Coffee Break</i></td>
  </tr>

  <tr>
    <td>10:15</td>
    <td>1242</td>
    <td>Porting Tock to x86 for Pluton
    <small>
    <p>Pluton is a root-of-trust technology jointly developed by Microsoft and
    various SoC partners. It is essentially a purpose-built security processor
    embedded directly within the SoC die. The SoC partners have some
    flexibility in dictating how the Pluton core is implemented, however
    Microsoft owns the firmware and has chosen to use Tock OS as a common
    platform for (nearly) all Pluton firmware deliverables.</p>
    <p>One of our SoC partners has chosen to implement Pluton using an
    embedded-class x86 core. To support this platform, our team created a port
    of Tock OS for the x86 architecture. This allowed us to easily port the
    rest of our Pluton logic, which lives in a usermode app, to the new
    platform with virtually zero code changes.</p>
    <p>This talk dives into the technical aspects of our x86 port, including
    interrupt handling, memory management, the syscall interface, and
    emulation. We will also touch on some of the pain points we encountered and
    some areas where we would like to make improvements.</p>
    </small></td>
    <td>Bobby Reynolds, <a href="https://microsoft.com/">Microsoft</a></td>
  </tr>

  <tr>
    <td>11:15</td>
    <td>1242</td>
    <td>Running TockOS on WebAssembly
    <small>
    <p>In addition to Cortex-M and RISC-V chips, TockOS can now run on
    WebAssembly.  Developing the kernel can be done with little to no setup, by
    running and debugging the operating system in a sandbox on your
    machine.</p>
    <p>The chip implementation provides the low-level drivers for peripherals
    like GPIO, UART and timers, which is possible due to the interoperability
    of the WebAssembly modules.
    Since hardware peripherals are not available, their state, which would
    usually be retrieved from memory-mapped registers, is updated through a
    WebSocket-based protocol written in TypeScript.
    Running <tt>libtock</tt> applications is done by emulating the Cortex-M4
    architecture using Unicorn.js (WASM reimport of the Unicorn CPU Emulator
    written in C).
    Developers can debug the WASM kernel through the Node.js Debugger, and the
    applications through a GDB Stub for Unicorn, written in TypeScript.</p>
    </small></td>
    <td>Irina Nita, <a href="https://oxidos.io/">OxidOS Automotive</a></td>
  </tr>

  <tr>
    <td>12:15</td>
    <td>Courtyard</td>
    <td colspan="2" class="break"><i>Lunch</i></td>
  </tr>

  <tr>
    <td>13:15</td>
    <td>1242</td>
    <td>CHERI
    <small>
    <!-- abstract pending -->
    </small></td>
    <td>Lawrence Esswood, <a href="https://google.com/">Google</a></td>
  </tr>

  <tr>
    <td>14:15</td>
    <td>1242</td>
    <td>Multiplexing Serial Port Messages
    <small>
    <p>Design, description, and implementation nuances of the new PacketBuffer
    mechanism. PacketBuffer allows the appending and prepending of metadata
    into messages sent on the serial port without re-allocating memory at every
    prepend/append.</p>
    <p>This talk will also introduce a new GUI app that connects to the board,
    reads from the serial port, and uses the metadata to filter messages by
    sender (the process console, debug messages, and each application) and to
    show them separately in the UI.</p>
    </small></td>
    <td>Amalia Camelia Simion, <a href="https://wyliodrin.com/">Wyliodrin</a></td>
  </tr>


  <tr>
    <td>15:15</td>
    <td>1244</td>
    <td colspan="2" class="break"><i>Coffee Break</i></td>
  </tr>
  <tr>
    <td>15:30</td>
    <td>1242</td>
    <td colspan="2">Lightning Talks
    <small>
    <p>10–15 minute talks on smaller highlights, works-in-progress,
    future ventures, or other subjects of interest.</p>
    <ul>
      <li><i>Encapsulated Functions</i>, Leon Schuermann, <a href="https://princeton.edu">Princeton</a></li>
      <li><i>OpenThread</i>, Tyler Potyondy, <a href="https://ucsd.edu">UC San Diego</a></li>
      <li><i>Dynamic Application Loading</i>, TBD, <a href="https://www.virginia.edu">UVA</a></li>
      <li><i>Reverse Engineering &amp; Securing an Insulin Pump</i>, Alex Bellon, <a href="https://ucsd.edu">UC San Diego</a></li>
      <li>[open slot]</li>
    </ul>
    </td>
    </small>
    </td>
  </tr>
  <tr>
    <td>14:45</td>
    <td>1242</td>
    <td>Closing Remarks</td>
    <td>Pat Pannuto, <a href="https://ucsd.edu/">UC San Diego</a></td>
  </tr>
  <tr>
    <td>17:00</td>
    <td rowspan="2">Courtyard</td>
    <td rowspan="2" colspan="2"><i>Reception &amp; Mixer</i>
    <p>Light hors d'ouvres and refreshments</p>
    </td>
  </tr>
  <tr>
    <td>18:00</td>
    <!-- rowspan -->
    <!-- rowspan -->
  </tr>
</table>


## Day 3 (June 28th, 2024) - Tutorials

This one-day, in-person Tutorial will teach how to use the Tock operating system
for secure and reliable embedded systems. The tutorial will provide hands-on
experience with three aspects of Tock: the kernel, secure systems, and
networking.

<table>
  <tr>
    <th></th>
    <th>Joint<br/>
    <small>(Livestreamed to both rooms)</small></th>
    <th>Security Track (1242)</th>
    <th>Networking Track (1202)</th>
  </tr>
  <tr>
    <td>8:10</td>
    <td><i>Continental Breakfast (1244)</i></td>
  </tr>
  <tr>
    <td>9:00</td>
    <td colspan="3">Welcome & Tock Introduction</td>
  </tr>
  <tr>
    <td>9:10</td>
    <td></td>
    <td>Computer Setup</td>
    <td>Computer Setup</td>
  </tr>
  <tr>
    <td>9:50</td>
    <td><i>Coffee Break (1244)</i></td>
  </tr>
  <tr>
    <td>10:00</td>
    <td></td>
    <td>Secure Element</td>
    <td>Thread Networking</td>
  </tr>
  <tr>
    <td>12:00</td>
    <td><i>Lunch Break (1244/Courtyard)</i></td>
  </tr>
  <tr>
    <td>13:00</td>
    <td></td>
    <td>Encapsulated Functions</td>
    <td>Remote Update</td>
  </tr>
  <tr>
    <td>14:30</td>
    <td><i>Coffee Break (1244)</i></td>
  </tr>
  <tr>
    <td>14:45</td>
    <td></td>
    <td>App signing</td>
    <td>Device discovery</td>
  </tr>
  <tr>
    <td>16:15</td>
    <td colspan="3">Wrap-up and next steps</td>
  </tr>
  <tr>
    <td>16:30</td>
    <td class="break" colspan="3"><i>Event ends — See you next year!</i></td>
  </tr>
</table>

