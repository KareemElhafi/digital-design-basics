# Traffic Light Controller



## 📌 Description



A finite state machine controlling traffic light transitions between GREEN, YELLOW, and RED states.



## 🏗️ Design Overview



* Type: FSM (Moore Machine)

* States: GREEN → YELLOW → RED

* Input: `rst`

* Output: `light\[2:0]`



## ⚙️ RTL Implementation



* Separate state register and next-state logic

* Moore output depends only on current state



## 🧪 Verification Strategy



* Random reset injection to test robustness

* Scoreboard models expected state transitions

* Cycle-by-cycle output validation



\## 📊 Results



* Correct cyclic transitions verified

* Reset behavior validated


