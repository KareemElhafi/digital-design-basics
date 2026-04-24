\# Digital Design Basics – SystemVerilog RTL \& Verification Portfolio



\## 📌 Overview



This repository presents a structured collection of \*\*digital design and verification projects\*\* implemented using \*\*SystemVerilog\*\*.

It demonstrates core skills in \*\*RTL design\*\*, \*\*verification architecture\*\*, and \*\*hardware modeling\*\*, following a modular and scalable methodology inspired by \*\*UVM-style environments\*\*.



The goal of this repository is to showcase a solid foundation for roles in:



\* Digital Design

\* Design Verification

\* ASIC / VLSI Engineering



\---



\## 🧠 Key Skills Demonstrated



\* RTL Design (Combinational, Datapath, FSM)

\* SystemVerilog-based Verification

\* Constrained Random Testing

\* Scoreboard-based Functional Checking

\* Modular Testbench Architecture

\* Debugging \& Functional Validation



\---



\## 🏗️ Repository Structure



```

rtl/

├── combinational/

│   ├── full\_adder.sv

│   ├── full\_subtractor.sv

│   └── mux.sv

│

├── datapath/

│   ├── rca\_4bit.sv

│   └── alu8bit.sv

│

└── fsm/

&#x20;   ├── seq\_detector.sv

&#x20;   └── traffic\_light.sv



verification/

├── <design>\_tb/

│   ├── interface.sv

│   ├── sequence\_item.sv

│   ├── generator.sv

│   ├── driver.sv

│   ├── monitor.sv

│   ├── scoreboard.sv

│   ├── environment.sv

│   └── <design>\_tb.sv

```



\---



\## 📂 Projects Included



\### 🔹 Combinational Logic



\* \*\*Full Adder\*\*

\* \*\*Full Subtractor\*\*

\* \*\*2:1 Multiplexer (MUX)\*\*



\### 🔹 Datapath Design



\* \*\*4-bit Ripple Carry Adder (RCA)\*\*

\* \*\*8-bit ALU\*\*



&#x20; \* Arithmetic, Logical, Shift, Comparison operations

&#x20; \* Handles edge cases (e.g., division by zero)



\### 🔹 Finite State Machines (FSM)



\* \*\*Sequence Detector\*\*

\* \*\*Traffic Light Controller\*\*



\---



\## ⚙️ Verification Methodology



Each design is verified using a reusable architecture consisting of:



\* \*\*Interface\*\* → connects DUT and testbench

\* \*\*Transaction (Sequence Item)\*\* → represents stimulus

\* \*\*Generator\*\* → produces randomized inputs

\* \*\*Driver\*\* → applies stimulus to DUT

\* \*\*Monitor\*\* → captures DUT outputs

\* \*\*Scoreboard\*\* → checks correctness

\* \*\*Environment\*\* → integrates all components



This structure mimics a \*\*lightweight UVM-style flow\*\* without full UVM overhead.



\---



\## 🧪 Verification Features



\* Constrained random stimulus generation

\* Functional checking via scoreboards

\* Separation of stimulus and checking

\* Reusable verification components

\* Deterministic simulation control



\---



\## 🚀 How to Run



\### Using ModelSim / QuestaSim



```bash

vlog rtl/\*\*/\*.sv verification/\*\*/\*.sv

vsim <top\_tb\_module>

run -all

```



Example:



```bash

vsim full\_adder\_tb

run -all

```



\---



\## 📊 Example Output



```

================================

&#x20;     SIMULATION REPORT

================================

PASS = XX

FAIL = 0

================================

```



\---



\## 🎯 Design Highlights



\* Clean and synthesizable RTL

\* Consistent naming conventions

\* Separation between design and verification

\* Scalable structure for larger projects

\* Industry-relevant verification approach



\---



\## 📈 Future Improvements



\* Functional coverage (covergroups)

\* Assertions (SVA)

\* Migration to full UVM

\* CI integration for automated simulation

\* Parameterized and reusable RTL modules



\---



\## 👤 Author



\*\*Kareem Salah\*\*

Electronics Engineering Student

Focused on Digital IC Design \& Verification



\---



\## 📬 Notes



This repository is part of a continuous learning journey toward \*\*professional ASIC Design \& Verification roles\*\*.

Feedback and suggestions are always welcome.



