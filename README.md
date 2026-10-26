# Beep-Sat Demo

Beep-Sat is a series of complete PyCubed software examples demonstrating a simple beaconing satellite that performs a handful of routine tasks, ported to support the **Raspberry Pi Pico 2 (RP2350)** running CircuitPython.

Both examples have **EXTREMELY** detailed write-ups. See links below:

| Beep-Sat         | Code<br>Status    | Documentation<br>Status   |
|:----------------:|:--------------:   |:-----------------------:|
|      basic       |    [Complete ✅](./basic/)     |      [Complete ✅](https://www.notion.so/Beep-Sat-basic-a3074e1925d74835bd3e2e3543819981)          |
|     advanced     |    [Complete ✅](./advanced/)    |      [Complete ✅](https://www.notion.so/Beep-Sat-advanced-2d93fbe63d1a42cc8ce084b6f19535ba)         |
|    advanced-2    |    [In Progress 🚧](https://github.com/pycubed/software_example_beepsat/tree/dev-advanced-2/advanced2)    |      [Not Started ❌](https://github.com/pycubed/software_example_beepsat/tree/dev-advanced-2/advanced2)         |

---

## Hardware Target: Raspberry Pi Pico 2 (RP2350)

This repository is configured to deploy to an RP2350-based board (such as the Raspberry Pi Pico 2) flashed with CircuitPython.

### ⚠️ Important: Delete Default `code.py` First

CircuitPython automatically looks for entry files in a fixed priority sequence:
1. `code.txt`
2. `code.py`
3. `main.txt`
4. `main.py`

A fresh CircuitPython install automatically generates a blank or placeholder `code.py` in the root of the `CIRCUITPY` drive. Because this repository uses **`main.py`** as its entry point, **you must manually delete the default `code.py` from the `CIRCUITPY` drive**. 

If you do not remove `code.py`, the microcontroller will prioritize and execute it instead of your synced Beep-Sat `main.py`.

---

## Deployment & Sync Script

A PowerShell deployment script is provided to streamline syncing your local files to the Pico 2 whenever you make changes. The script automatically locates the mounted `CIRCUITPY` drive and mirrors the files.

### Usage

1. Connect your Pico 2 via USB and confirm the `CIRCUITPY` volume mounts.
2. Ensure you have deleted any existing `code.py` on the drive.
3. Run the deployment script from PowerShell:

```powershell
# Deploy the 'basic' example (default)
.\deploy.ps1

# Or deploy a specific target directory (e.g., advanced)
.\deploy.ps1 -Source "advanced"