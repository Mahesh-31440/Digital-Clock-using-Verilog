# Digital Clock using Verilog

This project implements a **12-hour digital clock** using Verilog HDL. It includes second, minute, and hour counters along with an AM/PM toggle and alarm feature.

## 🧠 Components Implemented

- **BCD Counter** for 0–9 counting
- **Mod-6 Counter** for minute and second tens place
- **Hour Module** to handle 12-hour format and AM/PM logic
- **Top-level Clock Module** that integrates all submodules and supports alarm functionality

## 🔧 Features

- Resets to 12:00 AM
- Increments seconds → minutes → hours automatically
- Switches AM/PM at 12:00
- Alarm triggers based on provided time match (`r_time`) and AM/PM match (`r_m`)

## 📂 File Structure

- `digital_clock.v` — Contains all Verilog modules in one file
- `testbench.v` — (Optional) Simulates the functionality of the clock

## 🚀 Simulation

This design can be simulated in any Verilog simulator like **Vivado**, **ModelSim**, or **GTKWave**. No FPGA synthesis done yet.

---

Once pasted, press:
- `Ctrl + O` → to save
- `Enter` → to confirm the filename
- `Ctrl + X` → to exit

---

#### 2. **Add, commit, and push**

Now push it to GitHub:

```bash
git add README.md
git commit -m "Add proper README for digital clock project"
git push
