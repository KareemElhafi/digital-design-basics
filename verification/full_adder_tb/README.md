# Full Adder



## 📌 Description



A 1-bit full adder that computes the sum of three input bits (`a`, `b`, `cin`).

This design is a fundamental building block for arithmetic circuits such as ripple carry adders.



## 🏗️ Design Overview



* Type: Combinational Logic

* Inputs: `a`, `b`, `cin`

* Outputs: `sum`, `carry`



## ⚙️ RTL Implementation



* `sum` implemented using XOR chain

* `carry` implemented using majority logic



## 🧪 Verification Strategy



* Fully randomized stimulus for all input combinations

* Monitor captures DUT activity at clock edges

* Scoreboard computes expected outputs using reference logic



## 📊 Results



* Exhaustive behavior validated through random testing

* All outputs matched expected values





