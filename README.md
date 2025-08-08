# 🛡️ Undetected ELF Payload (AV Bypass) via Python Compilation (Nuitka Only)

This proof-of-concept demonstrates a method to bypass antivirus detection on Linux by compiling a Python reverse shell into an ELF binary using [Nuitka](https://github.com/Nuitka/Nuitka). The compiled payload remains undetected by major antivirus engines, including on VirusTotal.

> 📌 CVE submission in progress.

---

## 🚀 Summary

- 💻 Payload: Python reverse shell
- ⚙️ Method: Python → ELF using Nuitka only
- 🧩 Obfuscation: No extra strip or packing applied
- 🛡️ Result: 0 detections on VirusTotal (at the time of testing)

---

## 📦 PoC Files

| File | Description |
|------|-------------|
| `payload.py` | Python reverse shell |
| `build.sh` | Simple build script using Nuitka |
| `dist/payload` | Final compiled ELF binary |
| `vt-scan.txt` | VirusTotal scan result showing 0 detections |

---

## 🔧 Build Instructions

```bash
sudo apt update
sudo apt install python3 python3-pip gcc g++ -y
pip3 install nuitka

# Compile the Python file into an ELF binary
bash build.sh
