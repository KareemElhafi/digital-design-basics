# Full Subtractor



## 📌 Description



A 1-bit full subtractor that computes the difference between two bits with borrow input.



## 🏗️ Design Overview



* Type: Combinational Logic

* Inputs: `a`, `b`, `bin`

* Outputs: `diff`, `bout`



## ⚙️ RTL Implementation



* `diff` implemented using XOR chain

* `bout` derived from borrow logic conditions



## 🧪 Verification Strategy



* Randomized input generation

* Scoreboard computes expected difference and borrow

* Functional comparison performed cycle-by-cycle



## 📊 Results



* Correct behavior verified across all input scenarios





