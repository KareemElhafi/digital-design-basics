# 4-bit Ripple Carry Adder (RCA)



## 📌 Description



A 4-bit ripple carry adder built by cascading four full adders.

Demonstrates carry propagation across multiple stages.



## 🏗️ Design Overview



* Type: Datapath

* Inputs: `A\[3:0]`, `B\[3:0]`, `cin`

* Outputs: `sum\[3:0]`, `cout`



## ⚙️ RTL Implementation



* Structural design using four full adder instances

* Carry propagates sequentially between stages



## 🧪 Verification Strategy



* Randomized 4-bit inputs and carry-in

* Scoreboard computes expected 5-bit result (`sum + carry`)

* Full comparison using concatenated outputs



## 📊 Results



* Verified correct carry propagation and summation



## 💡 Notes



* Highlights propagation delay concept in ripple architectures

* Serves as a base for larger arithmetic units



