# Sequence Detector



## 📌 Description



A Moore finite state machine designed to detect a specific input bit sequence.



## 🏗️ Design Overview



* Type: FSM (Moore Machine)

* Input: `x`

* Output: `y`

* States: S0 → S4 (sequence tracking)



## ⚙️ RTL Implementation



* State machine tracks input sequence progression

* Output asserted when target sequence is detected



## 🧪 Verification Strategy



* Randomized input stream

* Scoreboard replicates FSM logic as reference model

* Output validated against expected detection behavior



## 📊 Results



* Sequence detection verified across multiple patterns




