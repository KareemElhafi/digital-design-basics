# 8-bit ALU



## 📌 Description



An 8-bit Arithmetic Logic Unit supporting a wide range of operations including arithmetic, logical, shift, and comparison.



## 🏗️ Design Overview



* Type: Datapath

* Inputs: `A\[7:0]`, `B\[7:0]`, `ALUControl\[3:0]`

* Output: `ALUResult\[15:0]`



## ⚙️ Supported Operations



* Arithmetic: ADD, SUB, INC, DEC

* Logical: AND, OR, XOR, NOT

* Shift: LEFT, RIGHT

* Advanced: MULTIPLY, DIVIDE

* Comparison: EQUALITY CHECK



## ⚙️ RTL Implementation



* Case-based control logic

* 16-bit output to accommodate overflow (e.g., multiplication)

* Safe handling of division by zero



## 🧪 Verification Strategy



* Constrained random generation of operands and control signals

* Scoreboard implements a full reference model

* Cycle-accurate checking of all operations



## 📊 Results



\* All operations verified successfully

\* Edge cases handled correctly



